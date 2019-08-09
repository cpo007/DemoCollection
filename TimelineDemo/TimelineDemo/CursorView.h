//
//  CursorView.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FrameUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface CursorView : UIView

//该属性设置时间标记控件的统一颜色,默认为蓝色
@property(strong,nonatomic)UIColor *color;

//该属性设置时间标记控件的文本显示颜色,默认为白色
@property(strong,nonatomic)UIColor *labelColor;

//设置时间
@property(copy,nonatomic)NSString *text;


@end

NS_ASSUME_NONNULL_END
