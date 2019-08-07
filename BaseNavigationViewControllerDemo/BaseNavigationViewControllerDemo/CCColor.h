//
//  CCColor.h
//  BaseNavigationViewControllerDemo
//
//  Created by cpo007@qq.com on 2019/8/6.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 输入十六进制的颜色值
 
 @param rgbValue 十六进制的颜色色值
 @param a 透明度
 @return 当前色值的颜色
 */
#define HEX_RGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


/**
 根据rgb色值生成颜色
 
 @param r 红
 @param g 绿
 @param b 蓝
 @return 生成的颜色
 */
#define RGB_Color(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]

#define Color ([CCColor shared])

@interface CCColor : NSObject

@property(strong,nonatomic,readonly)UIColor *navigation;

+ (instancetype) shared;
@end

NS_ASSUME_NONNULL_END
