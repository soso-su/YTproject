//
//  OrderDetailFooterView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderDetailFooterViewDelegate <NSObject>
- (void)giveupOrder;
- (void)payOrder;
@end
@interface OrderDetailFooterView : UIView
+ (instancetype)showDetailFooterView;
@property (strong, nonatomic)NSString *showMsg;
@property (nonatomic, assign)id <OrderDetailFooterViewDelegate>delegate;
@end
