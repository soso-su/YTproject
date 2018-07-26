//
//  RecordFooterView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "RecordFooterView.h"

@implementation RecordFooterView

+ (instancetype)showRecordFooterView{
    RecordFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return footerView;
}

@end
