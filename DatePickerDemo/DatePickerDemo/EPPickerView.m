//
//  EPPickerView.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "EPPickerView.h"

#define EPScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define EPScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@implementation EPPickerView

#pragma mark - --- init 视图初始化 ---
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupDefault];
        [self setupUI];
    }
    return self;
}

- (void)setupDefault{
    // 1.设置数据的默认值
    _title             = nil;
    _font              = [UIFont systemFontOfSize:17];
    _titleColor        = [UIColor blackColor];
    _borderButtonColor = [UIColor colorWithRed:205.0/255 green:205.0/255 blue:205.0/255 alpha:1] ;
    _heightPicker      = 240;
    _heightUnit        = (self.heightPicker - EPControlSystemHeight) / 5;
    _contentMode       = STPickerContentModeBottom;
    
    // 2.设置自身的属性
    self.bounds = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:102.0/255];
    self.layer.opacity = 0.0;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
//    // 3.添加子视图
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.tableViewFirst];
    [self.contentView addSubview:self.tableViewSecond];
    [self.contentView addSubview:self.tableViewThird];
    [self.contentView addSubview:self.selectedToplineView];
    [self.contentView addSubview:self.selctedBottomlineView];
//    [self.contentView addSubview:self.pickerView];
    [self.contentView addSubview:self.buttonLeft];
    [self.contentView addSubview:self.buttonRight];
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.lineViewDown];
}



- (void)setupUI{}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.contentMode == STPickerContentModeBottom) {
    }else {
        self.lineViewDown.ep_bottom = self.contentView.ep_height - EPControlSystemHeight;
        self.buttonLeft.ep_y = self.lineViewDown.ep_bottom + EPMarginSmall;
        self.buttonRight.ep_y = self.lineViewDown.ep_bottom + EPMarginSmall;
    }
}

#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

- (void)selectedOk{
    [self remove];
}

- (void)selectedCancel{
    [self remove];
}

#pragma mark - --- private methods 私有方法 ---


- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self setCenter:[UIApplication sharedApplication].keyWindow.center];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    if (self.contentMode == STPickerContentModeBottom) {
        CGRect frameContent =  self.contentView.frame;
        if (self.isIphonePlus) {
            frameContent.origin.y = EPScreenHeight - self.contentView.ep_height + 16;
        }else {
            frameContent.origin.y = EPScreenHeight - self.contentView.ep_height;
        }
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.layer setOpacity:1.0];
            self.contentView.frame = frameContent;
        } completion:^(BOOL finished) {
        }];
    }else {
        CGRect frameContent =  self.contentView.frame;
        if (self.isIphonePlus) {
            frameContent.origin.y = (EPScreenHeight - self.contentView.ep_height + 16)/2;
        }else {
            frameContent.origin.y = (EPScreenHeight - self.contentView.ep_height)/2;
        }
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.layer setOpacity:1.0];
            self.contentView.frame = frameContent;
            self.contentView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        } completion:^(BOOL finished) {
        }];
    }
}

- (void)remove{
    if (self.contentMode == STPickerContentModeBottom) {
        CGRect frameContent =  self.contentView.frame;
        frameContent.origin.y += self.contentView.ep_height;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.layer setOpacity:0.0];
            self.contentView.frame = frameContent;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else {
        CGRect frameContent =  self.contentView.frame;
        frameContent.origin.y += (EPScreenHeight+self.contentView.ep_height)/2;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.layer setOpacity:0.0];
            self.contentView.frame = frameContent;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

- (UIView *)contentView{
    if (!_contentView) {
        CGFloat contentX = 0;
        CGFloat contentY = EPScreenHeight;
        CGFloat contentW = EPScreenWidth;
        CGFloat contentH = self.heightPicker;
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(contentX, contentY, contentW, contentH)];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    }
    return _contentView;
}

- (UIView *)lineView{
    if (!_lineView) {
        CGFloat lineX = 0;
        CGFloat lineY = EPControlSystemHeight;
        CGFloat lineW = self.contentView.ep_width;
        CGFloat lineH = 0.5;
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
        [_lineView setBackgroundColor:self.borderButtonColor];
        _lineView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _lineView;
}

- (UIView *)selectedToplineView{
    if (!_selectedToplineView) {
        CGFloat lineX = 0;
        CGFloat lineY = self.lineView.ep_bottom + self.heightUnit * 2;
        CGFloat lineW = self.contentView.ep_width;
        CGFloat lineH = 0.5;
        _selectedToplineView = [[UIView alloc]initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
        [_selectedToplineView setBackgroundColor:self.borderButtonColor];
        _selectedToplineView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _selectedToplineView;
}

- (UIView *)selctedBottomlineView{
    if (!_selctedBottomlineView) {
        CGFloat lineX = 0;
        CGFloat lineY = self.lineView.ep_bottom + self.heightUnit * 3;
        CGFloat lineW = self.contentView.ep_width;
        CGFloat lineH = 0.5;
        _selctedBottomlineView = [[UIView alloc]initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
        [_selctedBottomlineView setBackgroundColor:self.borderButtonColor];
        _selctedBottomlineView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _selctedBottomlineView;
}

- (UITableView *)tableViewFirst{
    if (!_tableViewFirst) {
        CGFloat tableW = EPScreenWidth / 3 * 2;
        CGFloat tableH = self.contentView.ep_height - self.lineView.ep_bottom;
        CGFloat tableX = 0;
        CGFloat tableY = self.lineView.ep_bottom;
        _tableViewFirst = [[UITableView alloc] initWithFrame:CGRectMake(tableX, tableY, tableW, tableH)];
        _tableViewFirst.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tableViewFirst.backgroundColor = [UIColor blueColor];
        _tableViewFirst.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.heightUnit * 2)];
        [_tableViewFirst setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableViewFirst;
}

- (UITableView *)tableViewSecond{
    if (!_tableViewSecond) {
        CGFloat tableW = EPScreenWidth / 3  / 2;
        CGFloat tableH = self.contentView.ep_height - self.lineView.ep_bottom;
        CGFloat tableX = self.tableViewFirst.ep_right;
        CGFloat tableY = self.lineView.ep_bottom;
        _tableViewSecond = [[UITableView alloc] initWithFrame:CGRectMake(tableX, tableY, tableW, tableH)];
        _tableViewSecond.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tableViewSecond.backgroundColor = [UIColor redColor];
        _tableViewSecond.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.heightUnit * 2)];
        [_tableViewSecond setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return _tableViewSecond;
}

- (UITableView *)tableViewThird{
    if (!_tableViewThird) {
        CGFloat tableW = EPScreenWidth / 3 / 2;
        CGFloat tableH = self.contentView.ep_height - self.lineView.ep_bottom;
        CGFloat tableX = self.tableViewSecond.ep_right;
        CGFloat tableY = self.lineView.ep_bottom;
        _tableViewThird = [[UITableView alloc] initWithFrame:CGRectMake(tableX, tableY, tableW, tableH)];
        _tableViewThird.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tableViewThird.backgroundColor = [UIColor yellowColor];
        _tableViewThird.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.heightUnit * 2)];
        [_tableViewThird setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return _tableViewThird;
}


//- (UIPickerView *)pickerView
//{
//    if (!_pickerView) {
//        CGFloat pickerW = self.contentView.st_width;
//        CGFloat pickerH = self.contentView.st_height - self.lineView.st_bottom;
//        CGFloat pickerX = 0;
//        CGFloat pickerY = self.lineView.st_bottom;
//        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(pickerX, pickerY, pickerW, pickerH)];
//        [_pickerView setBackgroundColor:[UIColor whiteColor]];
//        _pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    }
//    return _pickerView;
//}

- (UIButton *)buttonLeft{
    if (!_buttonLeft) {
        CGFloat leftW = EPButtonSystemHeight;
        CGFloat leftH = self.lineView.ep_top - EPMargin;
        CGFloat leftX = EPMarginBig;
        CGFloat leftY = (self.lineView.ep_top - leftH) / 2;
        _buttonLeft = [[UIButton alloc]initWithFrame:CGRectMake(leftX, leftY, leftW, leftH)];
        [_buttonLeft setTitle:@"取消" forState:UIControlStateNormal];
        [_buttonLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_buttonLeft addBorderColor:self.borderButtonColor];
        [_buttonLeft.titleLabel setFont:self.font];
        [_buttonLeft addTarget:self action:@selector(selectedCancel) forControlEvents:UIControlEventTouchUpInside];
        _buttonLeft.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    }
    return _buttonLeft;
}

- (UIButton *)buttonRight{
    if (!_buttonRight) {
        CGFloat rightW = self.buttonLeft.ep_width;
        CGFloat rightH = self.buttonLeft.ep_height;
        CGFloat rightX = self.contentView.ep_width - rightW - self.buttonLeft.ep_x;
        CGFloat rightY = self.buttonLeft.ep_y;
        _buttonRight = [[UIButton alloc]initWithFrame:CGRectMake(rightX, rightY, rightW, rightH)];
        [_buttonRight setTitle:@"确定" forState:UIControlStateNormal];
        [_buttonRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonRight addBorderColor:self.borderButtonColor];
        [_buttonRight.titleLabel setFont:self.font];
        [_buttonRight addTarget:self action:@selector(selectedOk) forControlEvents:UIControlEventTouchUpInside];
        _buttonRight.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    }
    return _buttonRight;
}

- (UILabel *)labelTitle{
    if (!_labelTitle) {
        CGFloat titleX = self.buttonLeft.ep_right + EPMarginSmall;
        CGFloat titleY = 0;
        CGFloat titleW = self.contentView.ep_width - titleX * 2;
        CGFloat titleH = self.lineView.ep_top;
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        [_labelTitle setTextAlignment:NSTextAlignmentCenter];
        [_labelTitle setTextColor:self.titleColor];
        [_labelTitle setFont:self.font];
        _labelTitle.adjustsFontSizeToFitWidth = YES;
        _labelTitle.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _labelTitle;
}

- (UIView *)lineViewDown{
    if (!_lineViewDown) {
        CGFloat lineX = 0;
        CGFloat lineY = self.tableViewFirst.ep_bottom;
        CGFloat lineW = self.contentView.ep_width;
        CGFloat lineH = 0.5;
        _lineViewDown = [[UIView alloc]initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
        [_lineViewDown setBackgroundColor:self.borderButtonColor];
        _lineViewDown.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _lineViewDown;
}

- (BOOL)isIphonePlus{
    return (CGRectGetHeight([UIScreen mainScreen].bounds) >= 736) |
    (CGRectGetWidth([UIScreen mainScreen].bounds) >= 736);
}

@end
