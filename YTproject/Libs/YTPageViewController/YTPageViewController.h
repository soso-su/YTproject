//
//  YTPageViewController.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPageViewControllerConfiguration.h"

@protocol YTPageViewControllerDelegate <NSObject>

@optional
-(void)didScrollToViewController:(UIViewController *)viewController index:(NSInteger) index;

@end

@interface YTPageViewController : UIViewController

@property (nonatomic,weak)id<YTPageViewControllerDelegate> delegate;

/**
 初始化方法,需要正确设置vc的view的frame，否则可能会出现位置或大小不正确的问题
 @param viewControllers 控制器数组，每个控制器都需要有title，来作为menu的标题
 @return YTPageViewController
 */
+(instancetype)pageWithViewControllers:(NSArray *)viewControllers configuration:(YTPageViewControllerConfiguration *)configuration;

/**跳到某个指定的vc*/
-(void)selectViewController:(NSInteger )index;
@end
