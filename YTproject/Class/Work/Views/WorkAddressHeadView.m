//
//  WorkAddressHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "WorkAddressHeadView.h"

@implementation WorkAddressHeadView

+ (instancetype)headView {
    WorkAddressHeadView *preview = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return preview;
}

@end
