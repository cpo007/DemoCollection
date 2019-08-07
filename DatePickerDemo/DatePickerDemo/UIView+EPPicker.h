//
//  UIView+EPPicker.h
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EPPicker)

/** 1.间隔X值 */
@property (nonatomic, assign) CGFloat ep_x;

/** 2.间隔Y值 */
@property (nonatomic, assign) CGFloat ep_y;

/** 3.宽度 */
@property (nonatomic, assign) CGFloat ep_width;

/** 4.高度 */
@property (nonatomic, assign) CGFloat ep_height;

/** 5.中心点X值 */
@property (nonatomic, assign) CGFloat ep_centerX;

/** 6.中心点Y值 */
@property (nonatomic, assign) CGFloat ep_centerY;

/** 7.尺寸大小 */
@property (nonatomic, assign) CGSize ep_size;

/** 8.起始点 */
@property (nonatomic, assign) CGPoint ep_origin;

/** 9.上 */
@property (nonatomic) CGFloat ep_top;

/** 10.下 */
@property (nonatomic) CGFloat ep_bottom;

/** 11.左 */
@property (nonatomic) CGFloat ep_left;

/** 12.右 */
@property (nonatomic) CGFloat ep_right;


/**
 *  1.添加边框
 *
 *  @param color <#color description#>
 */
- (void)addBorderColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
