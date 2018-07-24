//
//  IntergralHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "IntergralHeadView.h"

@implementation IntergralHeadView

+ (instancetype)showIntergralHeadView{
    IntergralHeadView *headView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];
    return headView;
}

@end
