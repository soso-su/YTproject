//
//  YTBaseViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface YTBaseViewController : UIViewController

- (CGFloat)stateBarAndNavBarHeight;

- (CGFloat)stateHeight;

- (void)back;

@end
