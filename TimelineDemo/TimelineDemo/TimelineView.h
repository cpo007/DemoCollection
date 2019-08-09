//
//  TimelineView.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FrameUtil.h"
#import "TaskModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TimelineView : UIView

//showTimeForNow决定是否显示当前的手机时间对应的滑标，默认为false
@property(assign,nonatomic)BOOL showTimeForNow;
@property(copy,nonatomic)NSArray<TaskModel *> *dataSource;

@end

NS_ASSUME_NONNULL_END
