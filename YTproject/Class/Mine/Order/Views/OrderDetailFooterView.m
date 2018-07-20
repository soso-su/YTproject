//
//  OrderDetailFooterView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "OrderDetailFooterView.h"
@interface OrderDetailFooterView()
@property (weak, nonatomic) IBOutlet UILabel *orderMsgLabel;

@end

@implementation OrderDetailFooterView

+ (instancetype)showDetailFooterView{
    OrderDetailFooterView *footerView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return footerView;
}

- (void)setShowMsg:(NSString *)showMsg{
    _showMsg = showMsg;
    self.orderMsgLabel.text = showMsg;
}

- (IBAction)giveup:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate giveupOrder];
    }
}
- (IBAction)payment:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate payOrder];
    }
}

@end
