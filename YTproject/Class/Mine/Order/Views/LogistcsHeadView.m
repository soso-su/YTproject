//
//  LogistcsHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/21.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "LogistcsHeadView.h"

@implementation LogistcsHeadView

+ (instancetype)showHeadView{
    LogistcsHeadView *headView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return headView;
}

@end
