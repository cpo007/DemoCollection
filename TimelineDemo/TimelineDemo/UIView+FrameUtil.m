//
//  UIView+FrameUtil.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "UIView+FrameUtil.h"

@implementation UIView (FrameUtil)

- (void)setSt_x:(CGFloat)st_x
{
    CGRect frame = self.frame;
    frame.origin.x = st_x;
    self.frame = frame;
}

- (void)setSt_y:(CGFloat)st_y
{
    CGRect frame = self.frame;
    frame.origin.y = st_y;
    self.frame = frame;
}

- (CGFloat)st_x
{
    return self.frame.origin.x;
}

- (CGFloat)st_y
{
    return self.frame.origin.y;
}

- (void)setSt_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setSt_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)st_height
{
    return self.frame.size.height;
}

- (CGFloat)st_width
{
    return self.frame.size.width;
}

- (void)setSt_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)st_centerX
{
    return self.center.x;
}

- (void)setSt_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)st_centerY
{
    return self.center.y;
}

- (void)setSt_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)st_size
{
    return self.frame.size;
}

- (void)setSt_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)st_origin
{
    return self.frame.origin;
}

- (CGFloat)st_left {
    return self.frame.origin.x;
}

- (void)setSt_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)st_top {
    return self.frame.origin.y;
}

- (void)setSt_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)st_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setSt_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)st_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setSt_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


@end
