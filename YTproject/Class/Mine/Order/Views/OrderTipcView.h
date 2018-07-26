//
//  OrderTipcView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TextType) {
    TextLeft = 0,
    TextCenter,
};

@protocol OrderTipcViewDelegate <NSObject>
- (void)clickComfirm;
- (void)clickCancle;

@end

@interface OrderTipcView : UIView
@property (nonatomic ,strong) NSString *showStr;
@property (nonatomic, assign) id <OrderTipcViewDelegate>delegate;
@property (nonatomic, assign) TextType type;
+ (instancetype)showTipcView;

@end
