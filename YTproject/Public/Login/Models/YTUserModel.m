//
//  YTUserModel.m
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTUserModel.h"

static YTUserModel* _instance = nil;
@implementation YTUserModel

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [YTUserModel share] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [YTUserModel share] ;
}

@end
