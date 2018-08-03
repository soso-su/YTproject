//
//  YTPageViewControllerConfiguration.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPageViewControllerConfiguration.h"

@implementation YTPageViewControllerConfiguration

+(instancetype)defaultConfiguration{
    YTPageViewControllerConfiguration *configutaion = [[YTPageViewControllerConfiguration alloc]init];
    configutaion.menuHeight = 36.5;
    configutaion.menuMargin = 31;
    configutaion.menuWidth = kScreen_Width;
    configutaion.menuTintDefaultColor = [UIColor blackColor];
    configutaion.menuTintSelectedColor = [UIColor redColor];
    configutaion.indicatorViewColor = [UIColor redColor];
    configutaion.indicatorViewSize = CGSizeMake(46.5, 3.5);
    configutaion.menuTintFontSize = 12.5;
    
    return configutaion;
}

@end
