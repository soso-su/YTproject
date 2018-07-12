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


@end
