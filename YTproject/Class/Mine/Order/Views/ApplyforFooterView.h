//
//  ApplyforFooterView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ApplyforFooterViewDelegate <NSObject>

- (void)editLogist;

@end

@interface ApplyforFooterView : UIView
+ (instancetype)showApplyforFooterView;
@property (nonatomic, strong)NSString *msg;
@property (nonatomic, strong)NSString *state;
@property (nonatomic, strong)NSString *logist;
@property (nonatomic, assign)id <ApplyforFooterViewDelegate>delegate;

@end
