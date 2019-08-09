//
//  TaskView.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/8.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FrameUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskView : UIView

@property(strong,nonatomic)UIColor *lineColor;
@property(copy,nonatomic)NSString *text;

@end

NS_ASSUME_NONNULL_END
