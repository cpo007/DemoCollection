//
//  CursorView.m
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import "CursorView.h"

@interface CursorView()

@property(strong,nonatomic)UILabel *textLabel;

@end

@implementation CursorView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefault];
        [self setupUI];
    }
    return self;
}

- (void)setupDefault {
    
    _color = [UIColor blueColor];
    _labelColor = [UIColor whiteColor];
}

- (void)setupUI{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cursor"]];
    [self addSubview:imageView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, imageView.st_width, imageView.st_height)];
    textLabel.font = [UIFont systemFontOfSize:9];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = self.labelColor;
    textLabel.center = imageView.center;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = self.color;
    lineView.frame = CGRectMake(imageView.st_right, 0, kScreenWidth - imageView.st_right, 1);
    lineView.st_centerY = imageView.st_centerY;
    [self addSubview:lineView];
    
    self.st_size = CGSizeMake(kScreenWidth, imageView.st_height);

}

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
}

@end

