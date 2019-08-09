//
//  TaskView.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/8.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "TaskView.h"
#import "Masonry.h"

@interface TaskView()

@property(strong,nonatomic)UIView *lineView;
@property(strong,nonatomic)UILabel *label;

@end

@implementation TaskView


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, self.st_height)];
    [self addSubview:lineView];
    self.lineView = lineView;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:label];
    self.label = label;
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self);
        make.width.equalTo(@1);
        make.height.mas_equalTo(self.st_height);
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self).offset(5);
        make.trailing.equalTo(self).offset(-5);
        make.bottom.lessThanOrEqualTo(self).offset(-5);
    }];
    
    
}

-(void)setLineColor:(UIColor *)lineColor {
    self.lineView.backgroundColor = lineColor;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

@end
