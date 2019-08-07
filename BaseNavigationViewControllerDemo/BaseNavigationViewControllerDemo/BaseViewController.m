//
//  BaseViewController.m
//  BaseNavigationViewControllerDemo
//
//  Created by cpo007@qq.com on 2019/8/6.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {}

- (BOOL)prefersStatusBarHidden {
    return false;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setupNavigationView {
    
    _statusView = [[UIView alloc] init];
    _statusView.backgroundColor = [Color navigation];
    [self.view addSubview:_statusView];
    
    _navigationView = [[UIView alloc] init];
    _navigationView.backgroundColor = [Color navigation];
    [self.view addSubview:_navigationView];
    
    [self.statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.width.equalTo(self.view);
        make.bottom.equalTo(self.mas_topLayoutGuide);
    }];
    
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusView.mas_bottom);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    
}

- (void)setNavTitleView: (UIView *)titleView {
    
    if (_navigationView == nil) {
        [self setupNavigationView];
    }
    _titleView = titleView;
    [self.navigationView addSubview:_titleView];
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigationView);
        make.width.mas_equalTo(titleView.frame.size.width);
        make.height.mas_equalTo(titleView.frame.size.height);
    }];
    
}

- (void)setNavTitle: (NSString *)title {
    
    if (_navigationView == nil) {
        [self setupNavigationView];
    }
    if ([_titleView isKindOfClass:UILabel.class]) {
        [((UILabel *)self.titleView) setText:title];
    } else {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:22];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.text = title;
        [self.navigationView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.equalTo(self.navigationView);
            make.width.equalTo(self.navigationView).offset(100);
        }];
        _titleView = label;
    }
    
}

- (void)setNavLeftView: (UIView *)leftView {
    
    if (_navigationView == nil) {
        [self setupNavigationView];
    }
    [self.leftView removeFromSuperview];
    self.leftView = leftView;
    [self.navigationView addSubview:leftView];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.leading.equalTo(self.navigationView).offset(10);
        make.width.mas_equalTo(leftView.frame.size.width);
        make.height.mas_equalTo(leftView.frame.size.height);
    }];
    
}

- (void)setNavRightView: (UIView *)rightView {
    
    if (_navigationView == nil) {
        [self setupNavigationView];
    }
    [self.rightView removeFromSuperview];
    self.rightView = rightView;
    [self.navigationView addSubview:rightView];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.trailing.equalTo(self.navigationView).offset(0);
        make.width.mas_equalTo(rightView.frame.size.width);
        make.height.mas_equalTo(rightView.frame.size.height);
    }];
    
}

- (void)setBackButton {
    
    CGRect frame = CGRectMake(0, 0, 40, 40);
    UIButton *backButton = [[UIButton alloc] initWithFrame:frame];
    backButton.titleLabel.font = [UIFont systemFontOfSize:15];

    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    //        [backButton setImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavLeftView:backButton];
    
}

- (UIButton *)setNavRightButtonWithTitle: (NSString *)title {
    
    if (self.navigationView == nil) {
        [self setupNavigationView];
    }
    UIButton *rightButton = [[UIButton alloc] init];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5 , 10);
    
    self.rightView = rightButton;
    [self.navigationView addSubview:rightButton];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.trailing.equalTo(self.navigationView).offset(-10);
    }];
    
    return rightButton;
}

- (UIButton *)setNavRightButtonWithImage: (UIImage *)image {
    
    if (self.navigationView == nil) {
        [self setupNavigationView];
    }
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setImage:image forState:UIControlStateNormal];
    rightButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5 , 10);
    
    self.rightView = rightButton;
    [self.navigationView addSubview:rightButton];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.trailing.equalTo(self.navigationView).offset(0);
    }];
    
    return rightButton;
}

- (void)setNeedNavigationBar: (NSString *)title withNeedBackButton: (BOOL)needBackButton{
    
    if (self.navigationView == nil) {
        [self setupNavigationView];
    }
    [self setNavTitle:title];
    if (needBackButton) {
        [self setBackButton];
    }
    
}

- (void)setNeedNavigationBarWithSegment: (NSArray<NSString *> *)titleArray withNeedBackButton: (BOOL)needBackButton {
    
    if (self.navigationView == nil) {
        [self setupNavigationView];
    }
    if (self.titleView != nil && [self.titleView isKindOfClass:UISegmentedControl.class]) {
        UISegmentedControl *segment = ((UISegmentedControl *)self.titleView);
        if (segment.numberOfSegments != titleArray.count) {
            return;
        }
        int index = 0;
        for (NSString *title in titleArray) {
            [segment setTitle:title forSegmentAtIndex:index];
            index+=1;
        }
        return;
    }
    if (self.titleView != nil) {
        [self.titleView removeFromSuperview];
    }
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:titleArray];
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor whiteColor];
    [segment addTarget:self action:@selector(segmentSelectedDidChange:) forControlEvents:UIControlEventValueChanged];
    [self setNavTitleView:segment];
    
    if (needBackButton) {
        [self setBackButton];
    }
    
}

- (void)backAction: (UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)segmentSelectedDidChange: (UISegmentedControl *)segment {
    NSLog(@"%ld",(long)segment.selectedSegmentIndex);
}

@end
