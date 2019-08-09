//
//  UIView+FrameUtil.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface UIView (FrameUtil)

/** 1.间隔X值 */
@property (nonatomic, assign) CGFloat st_x;

/** 2.间隔Y值 */
@property (nonatomic, assign) CGFloat st_y;

/** 3.宽度 */
@property (nonatomic, assign) CGFloat st_width;

/** 4.高度 */
@property (nonatomic, assign) CGFloat st_height;

/** 5.中心点X值 */
@property (nonatomic, assign) CGFloat st_centerX;

/** 6.中心点Y值 */
@property (nonatomic, assign) CGFloat st_centerY;

/** 7.尺寸大小 */
@property (nonatomic, assign) CGSize st_size;

/** 8.起始点 */
@property (nonatomic, assign) CGPoint st_origin;

/** 9.上 */
@property (nonatomic) CGFloat st_top;

/** 10.下 */
@property (nonatomic) CGFloat st_bottom;

/** 11.左 */
@property (nonatomic) CGFloat st_left;

/** 12.右 */
@property (nonatomic) CGFloat st_right;

@end

NS_ASSUME_NONNULL_END
