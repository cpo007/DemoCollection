//
//  ViewController.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "TimelineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",MIN(@"1", @"2"));
    TimelineView *lineView = [[TimelineView alloc] init];
    [self.view addSubview:lineView];
    
    TaskModel *model1 = [TaskModel new];
    model1.ids = 1;
    model1.startTime = @"2019-08-08 10:00:00";
    model1.endTime = @"2019-08-08 12:00:00";
    model1.useTime = 120;
    model1.desc = @"辣是真的流弊流弊流弊流弊流弊流弊流弊";
    
    TaskModel *model2 = [TaskModel new];
    model2.ids = 1;
    model2.startTime = @"2019-08-08 11:00:00";
    model2.endTime = @"2019-08-08 12:50:00";
    model2.useTime = 110;
    model2.desc = @"辣是假的流流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流弊流r弊流弊流弊流弊流弊流弊流弊弊";
    
    TaskModel *model3 = [TaskModel new];
    model3.ids = 1;
    model3.startTime = @"2019-08-08 13:10:00";
    model3.endTime = @"2019-08-08 13:50:00";
    model3.useTime = 40;
    model3.desc = @"FGNB";
    
    TaskModel *model4 = [TaskModel new];
    model4.ids = 1;
    model4.startTime = @"2019-08-08 13:40:00";
    model4.endTime = @"2019-08-08 15:20:00";
    model4.useTime = 100;
    model4.desc = @"FGSB";
    
    TaskModel *model5 = [TaskModel new];
    model5.ids = 1;
    model5.startTime = @"2019-08-08 17:40:00";
    model5.endTime = @"2019-08-08 19:40:00";
    model5.useTime = 120;
    model5.desc = @"FGFGSBFGSBFGSBFGSBFGSBSB";
    
    TaskModel *model6 = [TaskModel new];
    model6.ids = 1;
    model6.startTime = @"2019-08-08 12:00:00";
    model6.endTime = @"2019-08-08 13:00:00";
    model6.useTime = 60;
    model6.desc = @"阿善动";
    
    NSArray *arr = @[model1,model2,model3,model4,model5,model6];
    lineView.dataSource = arr;

    // Do any additional setup after loading the view, typically from a nib.
}


@end
