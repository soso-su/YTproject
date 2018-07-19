//
//  YTPageViewController.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPageViewControllerConfiguration.h"

@interface YTPageViewController : UIViewController

/**
 初始化方法

 @param viewControllers 控制器数组，每个控制器都需要有title，来作为menu的标题
 @return YTPageViewController
 */
+(instancetype)pageWithViewControllers:(NSArray *)viewControllers configuration:(YTPageViewControllerConfiguration *)configuration;

@end
