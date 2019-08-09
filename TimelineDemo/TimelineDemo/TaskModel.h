//
//  TaskModel.h
//  TimelineDemo
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskModel : NSObject

@property(assign,nonatomic)NSInteger ids;
@property(copy,nonatomic)NSString *startTime;
@property(copy,nonatomic)NSString *endTime;
@property(assign,nonatomic)NSInteger useTime;
@property(copy,nonatomic)NSString *desc;


@end

NS_ASSUME_NONNULL_END
