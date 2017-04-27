
//
//  NSString+YAXExtension.m
//  WeiBo
//
//  Created by 余艾星 on 16/3/23.
//  Copyright © 2016年 余艾星. All rights reserved.
//

#import "NSString+YAXExtension.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (YAXExtension)

#pragma mark - 根据字符串计算字符串的size
- (CGSize)sizeWithSize:(CGSize)size font:(NSInteger)font {
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

- (CGSize)sizeOfMaxScreenSizeInFont:(NSInteger)font {
    
    return [self boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    
}



#pragma MARK - 判断手机号是否正确
/* 手机号码验证 */
- (BOOL)isMobileNumber
{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^[1][34578]\\d{9}";
    /**
     10 * 中国移动：China Mobile
     11 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12 */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15 * 中国联通：China Unicom
     16 * 130,131,132,152,155,156,185,186
     17 */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20 * 中国电信：China Telecom
     21 * 133,1349,153,180,189
     22 */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25 * 大陆地区固话及小灵通
     26 * 区号：010,020,021,022,023,024,025,027,028,029
     27 * 号码：七位或八位
     28 */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//获取运营商
- (NSString *)getOperators{

    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^[1][34578]\\d{9}";
    /**
     10 * 中国移动：China Mobile
     11 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12 */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15 * 中国联通：China Unicom
     16 * 130,131,132,152,155,156,185,186
     17 */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20 * 中国电信：China Telecom
     21 * 133,1349,153,180,189
     22 */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25 * 大陆地区固话及小灵通
     26 * 区号：010,020,021,022,023,024,025,027,028,029
     27 * 号码：七位或八位
     28 */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    if ([regextestcm evaluateWithObject:self] == YES) {
        
        return @"中国移动";
    }else if ([regextestcu evaluateWithObject:self] == YES) {
        
        return @"中国联通";
    }
    
    return @"中国电信";

}

- (NSString *)getOperatorsTel{

    if ([self isEqualToString:@"中国移动"]) {
        
        return @"10086";
    }else if ([self isEqualToString:@"中国联通"]) {
        
        return @"10010";
    }
    
    return @"10000";
}

- (NSString *)getMd5_32Bit {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

//加密算法
- (NSString *)getFuDaiMd5{
    //md5(md5(FUDAI{valiCode0})IADUF)

    //md5(md5(FUDAI{valiCode0})IADUF)
    return [[NSString stringWithFormat:@"%@IADUF",[[NSString stringWithFormat:@"FUDAI%@",self] getMd5_32Bit]] getMd5_32Bit];
}

- (NSString *)md5{

    return [self getMd5_32Bit];
}

//生成设备唯一标识
+ (NSString *)getDeviceMarkMd5{
    
    NSString *deviceMark = [[[UIDevice currentDevice].identifierForVendor UUIDString] getMd5_32Bit];
    
    return [deviceMark stringByReplacingCharactersInRange:NSMakeRange(0, 7) withString:@"[FUDAI]"];
}

//含有非法字符
- (BOOL)isNotLeagelPasssword{

    
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
    
}

#pragma mark - 提示框
- (void)showNotice{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:self
                                                      delegate:self
                                             cancelButtonTitle:@"知道了"
                                             otherButtonTitles:nil];
    
    
    [alertView show];
}

//获取时间戳
+ (NSNumber *)getTimestamp{

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSNumber *timeString = @([[NSString stringWithFormat:@"%.0f", a] integerValue]);
    
    return timeString;
}

#pragma mark - 判断程序是否是最新版本,从而判断是否需要进入引导界面
+ (BOOL)isNewVersion{
    
    //获取之前版本,与当前版本比较
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version_key"];
    
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    
    NSString *nowVersion = dict[@"CFBundleShortVersionString"];
    
    if ([oldVersion isEqualToString:nowVersion]) {
        
        return NO;
        
    }else{
        
        //保存当前最新版本
        [[NSUserDefaults standardUserDefaults] setObject:nowVersion forKey:@"version_key"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        return YES;
    }
    
}


+ (BOOL)isFirstInHighProve{
    
    //获取之前版本,与当前版本比较
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"highprove"];
    
    NSString *nowVersion = @"0000";
    
    if ([oldVersion isEqualToString:nowVersion]) {
        
        return NO;
        
    }else{
        
        //保存当前最新版本
        [[NSUserDefaults standardUserDefaults] setObject:nowVersion forKey:@"highprove"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        return YES;
    }
    
}

@end






