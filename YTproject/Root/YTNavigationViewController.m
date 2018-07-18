//
//  YTNavigationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTNavigationViewController.h"
#import "YTBaseViewController.h"
#import "UIImage+Color.h"

@interface YTNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation YTNavigationViewController

+ (void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[YTNavigationViewController class]]];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:18],NSFontAttributeName, RGB(255 ,255,255),NSForegroundColorAttributeName ,nil];
    navBar.titleTextAttributes = attributes;
    [navBar setShadowImage:[[UIImage alloc]init]];
    UIImage *image = [UIImage imageWithColor:DefaultColor];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.leftBarButtonItem.customView.hidden = YES;
    viewController.hidesBottomBarWhenPushed = NO;
    if (self.childViewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem.customView.hidden = NO;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = [super popViewControllerAnimated:animated];
    return vc;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
