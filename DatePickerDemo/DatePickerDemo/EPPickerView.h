//
//  EPPickerView.h
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPPickerViewUI.h"
#import "UIView+EPPicker.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, STPickerContentMode) {
    STPickerContentModeBottom, // 1.选择器在视图的下方
    STPickerContentModeCenter  // 2.选择器在视图的中间
};

@interface EPPickerView : UIView

/** 1.内部视图 */
@property (nonatomic, strong) UIView *contentView;
/** 2.边线,选择器和上方tool之间的边线 */
@property (nonatomic, strong)UIView *lineView;
/** 2.边线,恒定于中间表示选中对象的上边线 */
@property (nonatomic, strong)UIView *selectedToplineView;
/** 2.边线,恒定于中间表示选中对象的下边线 */
@property (nonatomic, strong)UIView *selctedBottomlineView;

/** 3.选择器 */
@property (nonatomic, strong)UITableView *tableViewFirst;
@property (nonatomic, strong)UITableView *tableViewSecond;
@property (nonatomic, strong)UITableView *tableViewThird;
///** 3.选择器 */
//@property (nonatomic, strong)UIPickerView *pickerView;
/** 4.左边的按钮 */
@property (nonatomic, strong)UIButton *buttonLeft;
/** 5.右边的按钮 */
@property (nonatomic, strong)UIButton *buttonRight;
/** 6.标题label */
@property (nonatomic, strong)UILabel *labelTitle;
/** 7.下边线,在显示模式是STPickerContentModeCenter的时候显示 */
@property (nonatomic, strong)UIView *lineViewDown;

/** 1.标题，default is nil */
@property(nullable, nonatomic,copy) NSString          *title;
/** 2.字体，default is nil (system font 17 plain) */
@property(null_resettable, nonatomic,strong) UIFont   *font;
/** 3.字体颜色，default is nil (text draws black) */
@property(null_resettable, nonatomic,strong) UIColor  *titleColor;
/** 4.按钮边框颜色颜色，default is RGB(205, 205, 205) */
@property(null_resettable, nonatomic,strong) UIColor  *borderButtonColor;
/** 5.选择器的高度，default is 240 */
@property (nonatomic, assign)CGFloat heightPicker;
/** 5.选择器的单位高度，default is 240 / 5 */
@property (nonatomic, assign)CGFloat heightUnit;

/** 6.视图的显示模式 */
@property (nonatomic, assign)STPickerContentMode contentMode;


/**
 *  5.创建视图,初始化视图时初始数据
 */
- (void)setupUI;

/**
 *  6.确认按钮的点击事件
 */
- (void)selectedOk;

/**
 *  7.显示
 */
- (void)show;

/**
 *  8.移除
 */
- (void)remove;


@end

NS_ASSUME_NONNULL_END
