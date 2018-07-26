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

@end

@implementation OrderTipcView

+ (instancetype)showTipcView{
    OrderTipcView *tipView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return tipView;
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
    if (self.delegate) {
        [self.delegate clickComfirm];
    }
}
- (IBAction)cancle:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate clickCancle];
    }
}

@end
