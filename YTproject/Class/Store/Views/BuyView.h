//
//  BuyView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyViewDelegate <NSObject>
- (void)deleteBuyView;

- (void)comfirmBuy;

@end

@interface BuyView : UIView

@property (nonatomic, strong) NSArray *dataSorce;

@property (nonatomic, assign)id <BuyViewDelegate>delegate;

@end
