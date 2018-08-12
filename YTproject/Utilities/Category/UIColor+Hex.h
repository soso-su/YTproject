//
//  UIColor+Hex.h
//  YTproject
//
//  Created by suhuahao on 2018/8/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithRGB:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor*)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
