//
//  YTTool.m
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTTool.h"

@implementation YTTool

+ (UIWindow*)getWindow {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return window;
}

+ (UIViewController *)getRootVc {
    UIWindow *window = [self getWindow];
    UIViewController *viewController = window.rootViewController;
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)viewController;
        return nav.childViewControllers.firstObject;
    }
    
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabVc = (UITabBarController *)viewController;
        UIViewController *selectVc = tabVc.selectedViewController;
        if ([selectVc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)selectVc;
            return nav.childViewControllers.firstObject;
        }
    }
    return viewController;
}

+ (CGSize)textStr:(NSString *)textStr boundingRectWithSize:(CGSize)size font:(UIFont *)font {
    NSDictionary *attributes = @{NSFontAttributeName : font};
    return [textStr boundingRectWithSize:size
                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              attributes:attributes
                                 context:nil].size;
}

+ (void)setLabelAttributeLineHeight:(CGFloat)height label:(UILabel *)label{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:height];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    label.attributedText = attributedString;
    label.lineBreakMode = NSLineBreakByCharWrapping;
}

+ (void)setLabelAttributeStr:(NSString *)str textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize otherStr:(NSString *)otherStr otherTextColor:(UIColor *)otherColor otherSize:(CGFloat)otherSize label:(UILabel *)label{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:str
                                                                             attributes:@{NSForegroundColorAttributeName: textColor,
                                                                                          NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}]];
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:otherStr
                                                                             attributes:@{NSForegroundColorAttributeName: otherColor,
                                                                                          NSFontAttributeName : [UIFont systemFontOfSize:otherSize]}]];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    
    label.attributedText = attributedString;
}


@end
