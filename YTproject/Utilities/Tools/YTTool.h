//
//  YTTool.h
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YTTool : NSObject

+ (UIWindow*)getWindow;
+ (UIViewController *)getRootVc;
+ (CGSize)textStr:(NSString *)textStr boundingRectWithSize:(CGSize)size font:(UIFont *)font;
//设置行距
+ (void)setLabelAttributeLineHeight:(CGFloat)height label:(UILabel *)label;

//设置富文本
+ (void)setLabelAttributeStr:(NSString *)str textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize  otherStr:(NSString *)otherStr otherTextColor:(UIColor*)otherColor otherSize:(CGFloat)otherSize label:(UILabel *)label;


@end
