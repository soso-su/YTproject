//
//  AffirmOrderFooterView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "AffirmOrderFooterView.h"

@implementation AffirmOrderFooterView

+ (instancetype)showFooterView{
    AffirmOrderFooterView *footView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return footView;
}

@end
