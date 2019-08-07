//
//  ViewController.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "EPDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)buttonDidClick{
    
    EPDatePicker *pickerView = [[EPDatePicker alloc] init];
    [self.view addSubview:pickerView];
    [pickerView show];

}

@end
