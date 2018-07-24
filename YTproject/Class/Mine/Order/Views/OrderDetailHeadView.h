//
//  OrderDetailHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"

@interface OrderDetailHeadView : UIView
@property (nonatomic, strong)OrderListModel *model;
+ (instancetype)showDetailHeadView;
@end
