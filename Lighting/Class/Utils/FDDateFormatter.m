//
//  FDDateFormatter.m
//  FuDai
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 fudai. All rights reserved.
//

#import "FDDateFormatter.h"

@implementation FDDateFormatter

static FDDateFormatter *_instance;


+ (instancetype)sharedFDDateFormatter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
        
        [_instance setDateFormat:@"YYYY-MM-dd"];
    });
    
    return _instance;
}

+ (NSString *)getCurrentTime{

    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [self sharedFDDateFormatter];
    return [dateFormatter stringFromDate:currentDate];
    
}

//获取当前时间，日期
+ (NSString *)getCurrentDay{

    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [self sharedFDDateFormatter];
    return [dateFormatter stringFromDate:currentDate];
}

+ (NSString *)getCurrentYear{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"YYYY"];
    
    return [dateFormatter stringFromDate:currentDate];
    
}

//获取上一天
+ (NSString *)getLastDayWithDay:(NSInteger)day{
    
    
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:day * (24*60*60)];
    
    NSString *dateString = [[self sharedFDDateFormatter] stringFromDate:yesterday];
    
    return dateString;
    
}

//获取下一天
+ (NSString *)getNextDayWithDay:(NSInteger)day{
    
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:day * (24*60*60)];
    
    NSString *dateString = [[self sharedFDDateFormatter] stringFromDate:yesterday];
    
    return dateString;
}

//根据日期获取星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate{
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

+ (NSString *)interceptTimeStampFromStr:(NSString *)str{

    NSTimeInterval _interval=[str doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy.MM.dd"];
    
    return [objDateformat stringFromDate: date];
    
}


@end








