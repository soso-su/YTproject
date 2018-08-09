//
//  ExpectedWorkModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpectedWorkModel : NSObject

//期望职位
@property (nonatomic, strong) NSString *expected_position;

//期望工作类型（0全职1兼职2实习）
@property (nonatomic, assign) NSInteger expected_type;

//期望行业
@property (nonatomic, assign) NSInteger expected_trade;

//目前居住城市
@property (nonatomic, strong) NSString *expected_live;

//补充说明
@property (nonatomic, strong) NSString *expected_supplement;

//预计到岗时间（0一周1本月内2一个月内）
@property (nonatomic, assign) NSInteger on_position;

@end
