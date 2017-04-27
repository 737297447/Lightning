//
//  NSString+YAXExtension.h
//  WeiBo
//
//  Created by 余艾星 on 16/3/23.
//  Copyright © 2016年 余艾星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YAXExtension)

- (CGSize)sizeOfMaxScreenSizeInFont:(NSInteger)font;

- (CGSize)sizeWithSize:(CGSize)size font:(NSInteger)font;

#pragma MARK - 判断手机号是否正确
/*手机号码验证 MODIFIED BY HELENSONG*/
- (BOOL)isMobileNumber;

- (NSString *)getMd5_32Bit;

//加密算法
- (NSString *)getFuDaiMd5;

//判断字符串中自包含字母与数字
- (BOOL)isNotLeagelPasssword;

//生成设备唯一标识
+ (NSString *)getDeviceMarkMd5;

#pragma mark - 提示框
- (void)showNotice;

//获取时间戳
+ (NSNumber *)getTimestamp;

+ (BOOL)isNewVersion;

- (NSString *)md5;

//获取运营商
- (NSString *)getOperators;
- (NSString *)getOperatorsTel;

+ (BOOL)isFirstInHighProve;

@end
