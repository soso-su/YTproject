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


@end
