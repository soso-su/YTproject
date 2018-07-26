//
//  OrderListModel.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,OrderState){
    OrderState_NotPay = 0, //待付款
    OrderState_CancleOrder = 1, //取消订单
    OrderState_PaySuccess = 2, //付款成功
    OrderState_NotSend = 3, //待发货
    OrderState_NotEvaluate = 4, //待评价
    OrderState_Refund_Ing = 5, //退款中（售后）
    OrderState_Refund_Fail = 6, //退款失败（售后）
    OrderState_Refund_Success = 7, //退款成功（售后）
    OrderState_NotTake = 8, //待收货
    OrderState_DealFinsh = 9, //交易完成
    OrderState_DealClose = 11, //交易关闭
};

@interface OrderListModel : NSObject

@property (nonatomic, assign)BOOL isHideBottom;

@property (nonatomic, assign)BOOL isHideRefund;

@property (nonatomic, assign)BOOL isHideLeftBtn;

@property (nonatomic, strong)NSString *stateStr;

@property (nonatomic, strong)NSString *leftBtnStr;

@property (nonatomic, strong)NSString *rightBtnStr;

@property (nonatomic, assign)OrderState orderState;

@end
