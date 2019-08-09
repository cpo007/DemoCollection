//
//  TimeUtil.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil

+ (NSString *)nowTimeString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:[NSDate new]];
}

+ (NSString *)nowTimeYYMMDD {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:[NSDate new]];
}

+ (NSString *)customTime: (NSString *)format withDate: (NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

+ (NSDate *)stringToDate: (NSString *)dateString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    return [formatter dateFromString:dateString];
}

+ (NSString *)stringToString: (NSString *)dateString withOutputFormat: (NSString *)outputFormat {
    NSDate *date = [TimeUtil stringToDate:dateString];
    return [TimeUtil customTime:outputFormat withDate:date];
}

@end

