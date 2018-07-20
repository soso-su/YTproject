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
    OrderState_NotSend = 1, //待发货
    OrderState_NotTake = 2, //待收货
    OrderState_NotEvaluate = 3, //待评价
    OrderState_Selled = 4, //售后
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
