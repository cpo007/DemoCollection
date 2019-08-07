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

@interface EPDatePicker : EPPickerView

/** 1.起始时间，默认为系统初始时间 */
@property (nonatomic, assign)NSDate *startDate;
/** 2.结束时间，默认为当天 */
@property (nonatomic, assign)NSDate *endDate;


@end

NS_ASSUME_NONNULL_END
