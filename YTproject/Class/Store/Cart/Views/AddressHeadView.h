//
//  AddressHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressHeadView : UIView
@property (weak, nonatomic) IBOutlet YTTouchView *selectAddress;
+ (instancetype)showHeaderView;
@end
