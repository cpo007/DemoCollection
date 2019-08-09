//
//  TimelineView.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "TimelineView.h"
#import "Masonry.h"
#import "CursorView.h"
#import "TimeUtil.h"
#import "TaskView.h"

@interface TimelineView()<UIScrollViewDelegate>

//以每一分钟为基本单位设定单位高度
@property(assign,nonatomic)CGFloat heightUnit;
//总分钟数
@property(assign,nonatomic)NSInteger minuteCount;
//时间轴总高度,时间轴总高度由总分钟数*单位高度得出
@property(assign,nonatomic)CGFloat timelineHeight;

@property(copy,nonatomic)NSArray *tasksArray;
@property(copy,nonatomic)NSMutableArray *taskViewArray;

@property(strong,nonatomic)UIScrollView *scrollView;
@property(strong,nonatomic)CursorView *cursorView;

@end

@implementation TimelineView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefault];
        [self setupUI];
    }
    return self;
}

- (void)setupDefault {
    _heightUnit = 0.5;
    _minuteCount = 24 * 60;
    _timelineHeight = self.heightUnit * self.minuteCount;
    _showTimeForNow = false;
    _tasksArray = [NSMutableArray array];
    
}

- (void)setupUI {
    
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.showsVerticalScrollIndicator = false;
    scrollView.showsHorizontalScrollIndicator = false;
//    scrollView.backgroundColor = [UIColor redColor];
    scrollView.contentSize = CGSizeMake(0, self.timelineHeight);
    scrollView.delegate = self;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    //标记时间刻度
    for (int i = 0; i < 24; i++) {
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.text = [[NSString alloc] initWithFormat:@"%d",i];
        [scrollView addSubview:label];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:lineView];
        
        label.frame = CGRectMake(0, i * self.heightUnit * 60, 20, 20);
        lineView.frame = CGRectMake(label.st_right + 10, 0, kScreenWidth - label.st_right - 20, 1);
        label.st_centerY = i * self.heightUnit * 60;
        lineView.st_centerY = label.st_centerY;

    }
    
    CursorView * cursorView = [[CursorView alloc] init];
    [scrollView addSubview:cursorView];
    self.cursorView = cursorView;
    
    [self refreshCursor];
    
}

//对外部传入数据进行数据结构重构
-(void)setDataSource:(NSArray<TaskModel *> *)dataSource {
    
    NSMutableDictionary *hashMap = [NSMutableDictionary new];
    
    for (TaskModel *task in dataSource) {
        
        int startHour = [TimeUtil stringToString:task.startTime withOutputFormat:@"HH"].intValue;
        int startMinute = [TimeUtil stringToString:task.startTime withOutputFormat:@"mm"].intValue;
        NSNumber *startSum = [NSNumber numberWithInt:startHour * 60 + startMinute];
        
        int endHour = [TimeUtil stringToString:task.endTime withOutputFormat:@"HH"].intValue;
        int endMinute = [TimeUtil stringToString:task.endTime withOutputFormat:@"mm"].intValue;
        NSNumber *endSum = [NSNumber numberWithInt:endHour * 60 + endMinute];

        BOOL isOverlap = false;
        for (NSArray<NSNumber *> *key in hashMap) {
            if (MAX(startSum.intValue,key.firstObject.intValue) <= MIN(endSum.intValue,key.lastObject.intValue)) {
                NSArray<NSNumber *> *newKey = @[[NSNumber numberWithInt:MIN(startSum.intValue, key.firstObject.intValue)],[NSNumber numberWithInt:MAX(endSum.intValue, key.lastObject.intValue)]];
                NSMutableArray *tmp = [NSMutableArray array];
                [tmp addObjectsFromArray:hashMap[key]];
                [tmp addObject:task];
                hashMap[key] = nil;
                hashMap[newKey] = tmp;
                isOverlap = true;
                break;
            }
        }
        
        if (!isOverlap) {
            NSArray<NSNumber *> *key = @[startSum,endSum];
            hashMap[key] = @[task];
        }
    }
    
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    for (id key in hashMap) {
        [tmpArr addObject:hashMap[key]];
    }
    self.tasksArray = tmpArr;
    [self refreshTimeline];
}

//对完成转换的数据开始插入到ScrollView中
- (void)refreshTimeline{
    
    for (TaskView *taskView in self.taskViewArray) {
        [taskView removeFromSuperview];
    }
    
    for (NSArray *tasks in self.tasksArray) {
        
        CGFloat taskViewW = (kScreenWidth - 30 - 10) / MIN(tasks.count, 4);
        
        int index = 0;
        for (TaskModel *task in tasks) {
            CGFloat taskViewH = task.useTime * self.heightUnit;
            CGFloat taskViewX = 30 + taskViewW * index;
            int startHour = [TimeUtil stringToString:task.startTime withOutputFormat:@"HH"].intValue;
            int startMinute = [TimeUtil stringToString:task.startTime withOutputFormat:@"mm"].intValue;
            CGFloat taskViewY = (startHour * 60 + startMinute) * self.heightUnit;
            TaskView *taskView = [[TaskView alloc] initWithFrame:CGRectMake(taskViewX, taskViewY, taskViewW, taskViewH)];
            taskView.lineColor = [UIColor redColor];
            taskView.backgroundColor = [UIColor grayColor];
            taskView.text = task.desc;
            
            [self.scrollView addSubview:taskView];
            [self.taskViewArray addObject:taskView];
            index+=1;
        }
        
        
    }
    
    
}

- (void)refreshCursor {
    
    NSDate *date = [NSDate new];
    NSString *hour = [TimeUtil customTime:@"HH" withDate:date];
    NSString *minute = [TimeUtil customTime:@"mm" withDate:date];
    self.cursorView.st_centerY = (hour.intValue * 60 + minute.intValue) * self.heightUnit;
    [self.cursorView setText: [[NSString alloc] initWithFormat:@"%@:%@",hour,minute]];
    
}

# pragma ScrollView Delegate

@end
