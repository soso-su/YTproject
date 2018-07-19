//
//  AddressHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "AddressHeadView.h"

@implementation AddressHeadView

+ (instancetype)showHeaderView{
    AddressHeadView *headView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return headView;
}


@end
