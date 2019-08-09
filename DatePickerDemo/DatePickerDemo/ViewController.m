//
//  ViewController.m
//  DatePickerDemo
//
//  Created by cpo007@qq.com on 2019/8/5.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "EPDatePicker.h"

@interface ViewController ()<EPDatePickerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)buttonDidClick{
    
    EPDatePicker *pickerView = [[EPDatePicker alloc] init];
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    pickerView.startDate = [NSDate dateWithTimeIntervalSince1970:([NSDate date].timeIntervalSince1970 - 60 * 60 * 24 * 100)];
    [pickerView show];

}

-(void)pickerDate:(EPDatePicker *)pickerDate dateString:(NSString *)dateString {

    self.timeLabel.text = dateString;
}

@end
