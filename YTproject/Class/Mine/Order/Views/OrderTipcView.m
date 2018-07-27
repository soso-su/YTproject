//
//  OrderTipcView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "OrderTipcView.h"

@interface OrderTipcView()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (nonatomic, copy)CallBall block;

@end

@implementation OrderTipcView

+ (instancetype)showTipcView{
    OrderTipcView *tipView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return tipView;
}

+ (void)showWithStr:(NSString *)str type:(TextType)type callBack:(CallBall)block{
    OrderTipcView *tip = [OrderTipcView showTipcView];
    tip.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    tip.backgroundColor = [UIColor colorWithWhite:50.0/255.0 alpha:0.4];
    tip.showStr = str;
    tip.type = type;
    tip.block = block;
    [[YTTool getWindow] addSubview:tip];
}


- (void)setShowStr:(NSString *)showStr{
    _showStr = showStr;
    self.tipLabel.text = showStr;
}

- (void)setType:(TextType)type{
    if (type == TextLeft) {
        self.tipLabel.textAlignment = NSTextAlignmentLeft;
    }else{
        self.tipLabel.textAlignment = NSTextAlignmentCenter;
    }
}

- (IBAction)comfirm:(UIButton *)sender {
    self.block();
    [self removeFromSuperview];
}
- (IBAction)cancle:(UIButton *)sender {
    [self removeFromSuperview];
}

@end
