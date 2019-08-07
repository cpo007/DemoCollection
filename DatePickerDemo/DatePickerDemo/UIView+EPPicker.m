//
//  UIView+EPPicker.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "UIView+EPPicker.h"

@implementation UIView (EPPicker)

- (void)setEp_x:(CGFloat)ep_x
{
    CGRect frame = self.frame;
    frame.origin.x = ep_x;
    self.frame = frame;
}

- (void)setEp_y:(CGFloat)ep_y
{
    CGRect frame = self.frame;
    frame.origin.y = ep_y;
    self.frame = frame;
}

- (CGFloat)ep_x
{
    return self.frame.origin.x;
}

- (CGFloat)ep_y
{
    return self.frame.origin.y;
}

- (void)setEp_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setEp_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)ep_height
{
    return self.frame.size.height;
}

- (CGFloat)ep_width
{
    return self.frame.size.width;
}

- (void)setEp_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)ep_centerX
{
    return self.center.x;
}

- (void)setEp_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)ep_centerY
{
    return self.center.y;
}

- (void)setEp_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)ep_size
{
    return self.frame.size;
}

- (void)setEp_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)ep_origin
{
    return self.frame.origin;
}

- (CGFloat)ep_left {
    return self.frame.origin.x;
}

- (void)setEp_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ep_top {
    return self.frame.origin.y;
}

- (void)setEp_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)ep_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setEp_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ep_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setEp_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)addBorderColor:(UIColor *)color{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:0.5];
    [self.layer setCornerRadius:4];
}

@end
