//
//  CCColor.m
//  BaseNavigationViewControllerDemo
//
//  Created by cpo007@qq.com on 2019/8/6.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "CCColor.h"


@implementation CCColor

static CCColor *_instance = nil;

+(instancetype) shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance= [[self alloc] init];
    });
    return _instance;
}

- (UIColor *)navigation {
    return RGB_Color(60, 100, 198);
}

@end
