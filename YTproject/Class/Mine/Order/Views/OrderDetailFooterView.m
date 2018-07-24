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
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *refundBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideBtnViewConstraint;

@property (weak, nonatomic) IBOutlet UIView *btnView;
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

- (void)setIsRefund:(BOOL)isRefund{
    _isRefund = isRefund;
}

- (void)setModel:(OrderListModel *)model{
//    self.btnView.hidden = YES;
//    self.hideBtnViewConstraint.priority = 1000;
    _model = model;
    if (self.isRefund) {
        self.bottomView.hidden = NO;
        self.btnView.hidden = YES;
        self.hideBtnViewConstraint.priority = 1000;
    }else{
        
        self.bottomView.hidden = YES;
        self.refundBtn.hidden = YES;
        switch (model.orderState) {
            case OrderState_NotPay: //待付款
                break;
            case OrderState_CancleOrder: //取消订单
                break;
            case OrderState_PaySuccess: //付款成功
                break;
            case OrderState_NotSend: //待发货
                
                self.leftBtn.hidden = YES;
                [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"ddxqBtn1"] forState:UIControlStateNormal];
                [self.rightBtn setTitle:@"退款" forState:UIControlStateNormal];
                [self.rightBtn setTitleColor:DefaultColor forState:UIControlStateNormal];
                
                break;
            case OrderState_NotEvaluate: //待评价
                
                self.leftBtn.hidden = YES;
                [self.rightBtn setTitle:@"评价" forState:UIControlStateNormal];
                
                break;
            case OrderState_Refund_Ing: //退款中（售后）
                break;
            case OrderState_Refund_Success: //退款成功（售后）
                self.btnView.hidden = YES;
                self.hideBtnViewConstraint.priority = 1000;
                break;
            case OrderState_Refund_Fail: //退款失败（售后）
                break;
            case OrderState_NotTake: //待收货
                
                [self.rightBtn setTitle:@"确认收货" forState:UIControlStateNormal];
                [self.leftBtn setTitle:@"查看物流" forState:UIControlStateNormal];
                self.refundBtn.hidden = NO;
                
                break;
            case OrderState_DealFinsh: //交易完成
                break;
            case OrderState_DealClose: //交易关闭
                
                break;
            default:
                break;
        }
    }
    
}

- (IBAction)giveup:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate giveupOrder:self.model];
    }
}
- (IBAction)payment:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate payOrder:self.model];
    }
}
- (IBAction)refund:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate refundOrder:self.model];
    }
}
- (IBAction)noReceive:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)returnSales:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)commit:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate commitOrder:self.model];
    }
}

@end
