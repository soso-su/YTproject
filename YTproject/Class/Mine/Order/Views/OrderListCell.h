//
//  OrderListCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"

@protocol OrderListCellDelegate <NSObject>

- (void)cancleOrder:(OrderListModel *)model;

- (void)comfirmOrder:(OrderListModel *)model;

@end

@interface OrderListCell : UITableViewCell

@property (nonatomic, assign)id <OrderListCellDelegate>delegate;

@property (nonatomic, strong)OrderListModel *listModel;

@end
