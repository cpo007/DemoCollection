//
//  BaseViewController.h
//  BaseNavigationViewControllerDemo
//
//  Created by cpo007@qq.com on 2019/8/6.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "CCColor.h"


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController


/**
 状态栏视图，确定实际状态栏高度
 */
@property(strong,nonatomic)UIView *statusView;
/**
 替代NavigationBar的自定义视图
 */
@property(strong,nonatomic)UIView *navigationView;
/**
 自定义导航栏视图的中间部分，根据不同的构造函数其实际为不同的UIView子类
 */
@property(strong,nonatomic)UIView *titleView;
/**
 自定义导航栏视图的左侧部分，根据不同的构造函数其实际为不同的UIView子类
 */
@property(strong,nonatomic)UIView *leftView;
/**
 自定义导航栏视图的右侧部分，根据不同的构造函数其实际为不同的UIView子类
 */
@property(strong,nonatomic)UIView *rightView;

/**
 子类控制器实现该函数配置UI
 */
- (void)setupUI;
/**
 函数实现默认配置无任何子视图的导航栏视图
 */
- (void)setupNavigationView;
/**
 函数实现配置了标题的导航栏视图，若自定义导航栏不存在则内部自动创建。
 */
- (void)setNavTitle: (NSString *)title;
/**
 函数可由外界传递自定义视图配置到导航栏视图的左视图，若自定义导航栏不存在则内部自动创建。
 */
- (void)setNavLeftView: (UIView *)leftView;
/**
 函数可由外界传递自定义视图配置到导航栏视图的右视图，若自定义导航栏不存在则内部自动创建。
 */
- (void)setNavRightView: (UIView *)rightView;
/**
 函数快速构造只显示文本的Button空间并显示在右视图，若自定义导航栏不存在则内部自动创建。
 */
- (UIButton *)setNavRightButtonWithTitle: (NSString *)title;
/**
 函数快速构造只显示图片的Button空间并显示在右视图，若自定义导航栏不存在则内部自动创建。
 */
- (UIButton *)setNavRightButtonWithImage: (UIImage *)image;
/**
 函数快速构造包含标题及选择是否包含返回按钮的自定义导航栏视图
 
 @param title 标题
 @param needBackButton 是否显示返回Button
 */
- (void)setNeedNavigationBar: (NSString *)title withNeedBackButton: (BOOL)needBackButton;

/**
 函数快速构造包含UISegmentedControl及选择是否包含返回按钮的自定义导航栏视图
 
 @param titleArray 接受NSString数组生成UISegmentedControl控件作为TitleView
 @param needBackButton 是否显示返回Button
 */
- (void)setNeedNavigationBarWithSegment: (NSArray<NSString *> *)titleArray withNeedBackButton: (BOOL)needBackButton;

//子类继承实现返回按钮点击事件，BaseViewController默认实现Pop函数
- (void)backAction: (UIButton *)sender;
//子类继承实现UISegmentedControl值改变事件，BaseViewController默认无实现
- (void)segmentSelectedDidChange: (UISegmentedControl *)segment;
@end

NS_ASSUME_NONNULL_END
