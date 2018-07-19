//
//  YTPageViewControllerConfiguration.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTPageViewControllerConfiguration : NSObject

#pragma mark Menu
/**菜单栏高度*/
@property (nonatomic,assign)CGFloat menuHeight;
/**菜单栏每个item的间隔*/
@property (nonatomic,assign)CGFloat menuMargin;
/**菜单栏字体默认颜色*/
@property (nonatomic,strong)UIColor *menuTintDefaultColor;
/**菜单栏字体选择颜色*/
@property (nonatomic,strong)UIColor *menuTintSelectedColor;
/**菜单栏字体大小*/
@property (nonatomic,assign)CGFloat menuTintFontSize;
/**菜单栏下滑指示器大小*/
@property (nonatomic,assign)CGSize indicatorViewSize;
/**菜单栏下滑指示器颜色*/
@property (nonatomic,assign)UIColor *indicatorViewColor;

+(instancetype)defaultConfiguration;

@end
