//
//  EPTimeUtil.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/9.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "EPTimeUtil.h"

@implementation EPTimeUtil

//获取当前时间的时间字符串，以yyyy-MM-dd HH:mm:ss的格式
+ (NSString *)nowTimeString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:[NSDate new]];
}

//获取当前时间的时间字符串，以yyyy-MM-dd的格式
+ (NSString *)nowTimeYYMMDD {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:[NSDate new]];
}

//根据传入的格式字符串和Date对象快速构造自定义的时间字符串
+ (NSString *)customTimeWithFormat: (NSString *)format withDate: (NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

//根据传入的时间字符串返回Date对象，格式定为yyyy-MM-dd HH:mm:ss
+ (NSDate *)stringToDateWithDateString: (NSString *)dateString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    return [formatter dateFromString:dateString];
}

//根据传入的时间字符串返回Date对象，可自定义传入时间字符串的格式
+ (NSDate *)stringToDateWithDateString: (NSString *)dateString withFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = format;
    return [formatter dateFromString:dateString];
}

@end
