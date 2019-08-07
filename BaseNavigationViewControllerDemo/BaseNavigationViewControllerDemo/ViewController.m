//
//  ViewController.m
//  BaseNavigationViewControllerDemo
//
//  Created by cpo007@qq.com on 2019/8/6.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedNavigationBar:@"hello" withNeedBackButton:true];
    UIButton *button = [self setNavRightButtonWithTitle:@"一个"];
    [button addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    NSArray *titleArray = @[@"第一",@"第二",@"第三"];
//
//    [self setNeedNavigationBarWithSegment:titleArray withNeedBackButton:true];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)rightButtonDidClick: (UIButton *)sender {
    NSLog(@"%@",@"点击了");
}

- (IBAction)buttonDidClick:(UIButton *)sender {
    
    NSArray *titleArray = @[@"第四",@"第五",@"第六"];
    
    [self setNeedNavigationBarWithSegment:titleArray withNeedBackButton:true];
}


@end
