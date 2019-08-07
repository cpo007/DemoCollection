//
//  EPDatePicker.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "EPDatePicker.h"

@implementation EPDatePicker


- (void)setupUI{
    self.title = @"请选择日期";
    
    _startDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSLog(@"%@",self.startDate);
    _endDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%@",self.endDate);
    
    
}

- (void)setStartDate:(NSDate *)startDate{
    
}

- (void)setEndDate:(NSDate *)endDate{
    
}

@end
