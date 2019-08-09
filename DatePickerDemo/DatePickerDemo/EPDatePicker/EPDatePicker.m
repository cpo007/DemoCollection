//
//  EPDatePicker.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "EPDatePicker.h"
#import "PGPickerView/PGPickerView.h"
#import "EPTimeUtil.h"

@interface EPDatePicker() <PGPickerViewDelegate,PGPickerViewDataSource>

/** 1.date数组，包含起始时间到结束时间的每一天 */
@property(copy,nonatomic)NSArray<NSDate *> *dateArray;
/** 2.当前时间，每次调用刷新选择器的函数时刷新*/
@property(strong,nonatomic)NSDate *nowDate;
/** 3.选中的时间，精确到天*/
@property(strong,nonatomic)NSDate *selectedDate;
/** 4.选中的时间，小时单位*/
@property(assign,nonatomic)NSInteger selectedHour;
/** 5.选中的时间，分钟单位*/
@property(assign,nonatomic)NSInteger selctedMinute;

@end

@implementation EPDatePicker


//内部基本控件配置
- (void)setupUI{
    self.title = @"请选择日期";
    
    _startDate = [NSDate new];
    _endDate = [NSDate dateWithTimeIntervalSince1970:self.startDate.timeIntervalSince1970 + 60 * 60 * 24 * 7];
    
    self.secondUnit.text = @"时";
    self.thirdUnit.text = @"分";
    
    self.pickerViewFirst.delegate = self;
    self.pickerViewFirst.dataSource = self;
    self.pickerViewSecond.delegate = self;
    self.pickerViewSecond.dataSource = self;
    self.pickerViewThird.delegate = self;
    self.pickerViewThird.dataSource = self;
    
    self.pickerViewFirst.textFontOfSelectedRow = [UIFont systemFontOfSize:13];
    self.pickerViewFirst.textFontOfOtherRow = [UIFont systemFontOfSize:13];
    self.pickerViewSecond.textFontOfSelectedRow = [UIFont systemFontOfSize:13];
    self.pickerViewSecond.textFontOfOtherRow = [UIFont systemFontOfSize:13];
    self.pickerViewThird.textFontOfSelectedRow = [UIFont systemFontOfSize:13];
    self.pickerViewThird.textFontOfOtherRow = [UIFont systemFontOfSize:13];
    
    self.pickerViewSecond.isCycleScroll = true;
    
    self.pickerViewFirst.rowHeight = (self.heightPicker - EPControlSystemHeight) / 5;
    self.pickerViewSecond.rowHeight = (self.heightPicker - EPControlSystemHeight) / 5;
    self.pickerViewThird.rowHeight = (self.heightPicker - EPControlSystemHeight) / 5;

    self.pickerViewFirst.tag = 101;
    self.pickerViewSecond.tag = 102;
    self.pickerViewThird.tag = 103;
    
}

//继承实现，在呼出前刷新数据配置
- (void)show {
    [self reloadData];
    [super show];
}

//确认点击时的回调，通过代理返回时间戳字符串
-(void)selectedOk {
    
    if ([self.delegate respondsToSelector:@selector(pickerDate:dateString:)]) {
        NSString* timeYYYYMMDD = [EPTimeUtil customTimeWithFormat:@"yyyy-MM-dd" withDate:self.selectedDate];
        NSString *dateString = [NSString stringWithFormat:@"%@ %02ld:%02ld:00",timeYYYYMMDD,self.selectedHour,self.selctedMinute];
        [self.delegate pickerDate:self dateString:dateString];
    }
    [super selectedOk];
    
}

//刷新数据，并将选择器指向当前时间
- (void)reloadData{
    
    NSString *startDateString = [EPTimeUtil customTimeWithFormat:@"yyyy-MM-dd" withDate:self.startDate];
    NSDate *startDate = [EPTimeUtil stringToDateWithDateString:startDateString withFormat:@"yyyy-MM-dd"];
    
    NSString *endDateString = [EPTimeUtil customTimeWithFormat:@"yyyy-MM-dd" withDate:self.endDate];
    NSDate *endDate = [EPTimeUtil stringToDateWithDateString:endDateString withFormat:@"yyyy-MM-dd"];
    
    NSString *nowDateString = [EPTimeUtil customTimeWithFormat:@"yyyy-MM-dd" withDate:[NSDate new]];
    NSDate *nowDate = [EPTimeUtil stringToDateWithDateString:nowDateString withFormat:@"yyyy-MM-dd"];
    
    self.nowDate = nowDate;

    NSMutableArray<NSDate *> *dateArray = [NSMutableArray<NSDate *> new];
    
    BOOL findNowIndex = false;
    int index = 0;
    while (startDate.timeIntervalSince1970 <= endDate.timeIntervalSince1970) {
        [dateArray addObject:startDate];
        if (!findNowIndex) {
            if (startDate.timeIntervalSince1970 == nowDate.timeIntervalSince1970) {
                findNowIndex = true;
            } else {
                index+=1;
            }
        }
        startDate = [NSDate dateWithTimeIntervalSince1970:startDate.timeIntervalSince1970 + 60 * 60 * 24];
    }
    self.dateArray = dateArray;
    
    [self.pickerViewFirst reloadAllComponents];
    [self.pickerViewSecond reloadAllComponents];
    [self.pickerViewThird reloadAllComponents];
    
    int hour = [EPTimeUtil customTimeWithFormat:@"HH" withDate:[NSDate new]].intValue;
    int minute = [EPTimeUtil customTimeWithFormat:@"mm" withDate:[NSDate new]].intValue;
    if (minute > 45) {
        hour+=1;
        minute = 0;
    } else if (minute < 15) {
        minute = 0;
    } else {
        minute = 30;
    }
    hour = minute > 30 ? hour + 1 : hour;
    
    self.selectedDate = nowDate;
    self.selectedHour = hour;
    self.selctedMinute = minute;
    
    [self.pickerViewFirst selectRow:index inComponent:0 animated:false];
    [self.pickerViewSecond selectRow:hour inComponent:0 animated:false];
    [self.pickerViewThird selectRow:(minute >= 15 && minute <= 45)  ? 1 : 0 inComponent:0 animated:false];
    
}

#pragma UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(PGPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(PGPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    switch (pickerView.tag) {
        case 101:
            return self.dateArray.count;
        case 102:
            return 24;
        case 103:
            return 2;
        default:
            return  0;
    }
    
}

#pragma UIPickerViewDelegate
- (nullable NSString *)pickerView:(PGPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    //根据数据配置时间显示文本
    NSString *title;
    switch (pickerView.tag) {
        case 101:
        {
            NSDate *date = self.dateArray[row];
            NSString *timeyyyyMMdd = [EPTimeUtil customTimeWithFormat:@"yyyy-MM-dd" withDate:date];
            NSString *weekday = [self getWeekdayStringWithDate:date];
            NSString *day = [self getCustomTimeString:date];
            title = [NSString stringWithFormat:@"%@  %@  %@",timeyyyyMMdd,weekday,day];
        }
            break;
        case 102:
            title = [NSString stringWithFormat:@"%02ld",row];
            break;
        case 103:
            title = [NSString stringWithFormat:@"%02d",row == 0 ? 0 : 30];
            break;
        default:
            break;
    }
    return title;
}

- (void)pickerView:(PGPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (pickerView.tag) {
        case 101:
            if (row < self.dateArray.count) {
                self.selectedDate = self.dateArray[row];
            }
            break;
        case 102:
            self.selectedHour = row;
            break;
        case 103:
            self.selctedMinute = row == 0 ? 0 : 30;
        default:
            break;
    }
    
}

# pragma 私有函数
//根据传入时间与全局属性nowDate对比换算传入时间与nowDate的差距
- (NSString *)getCustomTimeString: (NSDate *)inputDate {
    
    NSInteger timeSince1970ForNow = self.nowDate.timeIntervalSince1970;
    NSInteger timeSince1970ForInput = inputDate.timeIntervalSince1970;
    NSInteger offset = timeSince1970ForInput - timeSince1970ForNow;
    NSString *timeStr;

    if (offset > 0 ) {
        NSInteger day = offset / 60 / 60 / 24;
        switch (day) {
            case 1:
                timeStr = @"明天";
                break;
            case 2:
                timeStr = @"后天";
                break;
            default:
                timeStr = [NSString stringWithFormat:@"%ld天后",day];
                break;
        }
    } else if (offset < 0) {
        
        NSInteger day = ABS(offset / 60 / 60 / 24);
        switch (day) {
            case 1:
                timeStr = @"昨天";
                break;
            case 2:
                timeStr = @"前天";
                break;
            default:
                timeStr = [NSString stringWithFormat:@"%ld天前",day];
                break;
        }
    } else {
        timeStr = @"今天";
    }
    
    return timeStr;
}

//根据传入时间返回周次中文文本
- (NSString *)getWeekdayStringWithDate: (NSDate *)date {
    NSInteger weekInt = [self convertDateToFirstWeekDay:date];
    NSString *timeStr;
    switch (weekInt) {
        case 1:
            timeStr = @"周日";
            break;
        case 2:
            timeStr = @"周一";
            break;
        case 3:
            timeStr = @"周二";
            break;
        case 4:
            timeStr = @"周三";
            break;
        case 5:
            timeStr = @"周四";
            break;
        case 6:
            timeStr = @"周五";
            break;
        case 7:
            timeStr = @"周六";
            break;
        default:
            break;
    }
    return timeStr;
}

//根据date获取当月周几
- (NSInteger)convertDateToFirstWeekDay:(NSDate *)date {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:date];
    
    return [comps weekday];  //美国时间周日为星期的第一天，所以周日-周六为1-7，改为0-6方便计算
}


@end
