//
//  FDDateFormatter.h
//  FuDai
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 fudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDDateFormatter : NSDateFormatter

+ (instancetype)sharedFDDateFormatter;

+ (NSString *)getCurrentTime;

//获取当前日期
+ (NSString *)getCurrentDay;

+ (NSString *)getCurrentYear;

//获取上一天
+ (NSString *)getLastDayWithDay:(NSInteger)day;

//获取下一天
+ (NSString *)getNextDayWithDay:(NSInteger)day;

//根据日期获取星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;

+ (NSString *)interceptTimeStampFromStr:(NSString *)str;
@end
