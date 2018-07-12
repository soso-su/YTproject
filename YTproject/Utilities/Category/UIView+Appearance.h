//
//  UIView+Appearance.h
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Appearance)

@property (nonatomic, strong) IBInspectable UIColor *hr_BorderColor;

@property (nonatomic, assign) IBInspectable CGFloat hr_BorderWidth;

@property (nonatomic, assign) IBInspectable CGFloat hr_CornerRadius;

@property (nonatomic, strong) IBInspectable UIColor *hr_DisableColor;

@property (nonatomic, strong) IBInspectable UIColor *hr_EnabledColor;

@property (nonatomic, assign) IBInspectable BOOL hr_ClipToBounds;

+ (instancetype)loadNibView;

@end
