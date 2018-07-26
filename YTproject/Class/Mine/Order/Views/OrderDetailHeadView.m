//
//  OrderDetailHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "OrderDetailHeadView.h"

@interface OrderDetailHeadView()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation OrderDetailHeadView

+ (instancetype)showDetailHeadView{
    OrderDetailHeadView *headView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return headView;
}

- (void)setModel:(OrderListModel *)model{
    _model = model;
    self.stateLabel.text = model.stateStr;
}

@end
