//
//  EPDatePicker.h
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPPickerView.h"

NS_ASSUME_NONNULL_BEGIN

@class EPDatePicker;
@protocol  EPDatePickerDelegate<NSObject>

/** 2.点击确定时回调，返回yyyy-MM-dd HH:mm:ss结构的时间字符串 */
- (void)pickerDate:(EPDatePicker *)pickerDate dateString:(NSString *)dateString;

@end

@interface EPDatePicker : EPPickerView

/** 1.起始时间，默认为系统初始时间 */
@property (nonatomic, strong)NSDate *startDate;
/** 2.结束时间，默认为当天 */
@property (nonatomic, strong)NSDate *endDate;
/** 3.代理属性 */
@property(nonatomic, weak)id <EPDatePickerDelegate>delegate ;


@end

NS_ASSUME_NONNULL_END
