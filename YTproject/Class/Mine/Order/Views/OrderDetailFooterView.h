//
//  OrderDetailFooterView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"

@protocol OrderDetailFooterViewDelegate <NSObject>
- (void)giveupOrder:(OrderListModel *)model;
- (void)payOrder:(OrderListModel *)model;
- (void)refundOrder:(OrderListModel *)model;
- (void)commitOrder:(OrderListModel *)model;
@end
@interface OrderDetailFooterView : UIView
+ (instancetype)showDetailFooterView;
@property (strong, nonatomic)OrderListModel *model;
@property (strong, nonatomic)NSString *showMsg;
@property (nonatomic, assign)id <OrderDetailFooterViewDelegate>delegate;
@property (nonatomic,assign)BOOL isRefund;
@end
