//
//  EPTimeUtil.h
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/9.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EPTimeUtil : NSObject

//获取当前时间的时间字符串，以yyyy-MM-dd HH:mm:ss的格式
+ (NSString *)nowTimeString;
//获取当前时间的时间字符串，以yyyy-MM-dd的格式
+ (NSString *)nowTimeYYMMDD;
//根据传入的格式字符串和Date对象快速构造自定义的时间字符串
+ (NSString *)customTimeWithFormat: (NSString *)format withDate: (NSDate *)date;
//根据传入的时间字符串返回Date对象，格式定为yyyy-MM-dd HH:mm:ss
+ (NSDate *)stringToDateWithDateString: (NSString *)dateString;
//根据传入的时间字符串返回Date对象，可自定义传入时间字符串的格式
+ (NSDate *)stringToDateWithDateString: (NSString *)dateString withFormat:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
