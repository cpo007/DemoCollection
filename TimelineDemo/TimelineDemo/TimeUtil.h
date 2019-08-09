//
//  TimeUtil.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface TimeUtil : NSObject

+ (NSString *)nowTimeString;
+ (NSString *)nowTimeYYMMDD;
+ (NSString *)customTime: (NSString *)format withDate: (NSDate *)date;
+ (NSDate *)stringToDate: (NSString *)dateString;
+ (NSString *)stringToString: (NSString *)dateString withOutputFormat: (NSString *)outputFormat;
@end

NS_ASSUME_NONNULL_END

