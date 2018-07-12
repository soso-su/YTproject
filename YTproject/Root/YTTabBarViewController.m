//
//  YTTabBarViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTTabBarViewController.h"
#import "YTNavigationViewController.h"
#import "YTWorkViewController.h"
#import "YTLocalViewController.h"
#import "YTServerViewController.h"
#import "YTStoreViewController.h"
#import "YTMineViewController.h"

@interface YTTabBarViewController ()

@end

@implementation YTTabBarViewController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectAttrs[NSForegroundColorAttributeName] = RGB(255, 67, 67);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    [self setUpUI];
}

- (void)setUpUI{
    [self setUpChildVc:[[YTWorkViewController alloc]init] title:@"工作" image:[UIImage imageNamed:@"tabbarWork"] selectImage:[UIImage imageNamed:@"tabbarWorkPre"]];
    [self setUpChildVc:[[YTLocalViewController alloc]init] title:@"本地" image:[UIImage imageNamed:@"tabbarLocal"] selectImage:[UIImage imageNamed:@"tabbarLocalPre"]];
    [self setUpChildVc:[[YTServerViewController alloc]init] title:@"服务" image:[UIImage imageNamed:@"tabbarServe"] selectImage:[UIImage imageNamed:@"tabbarServePre"]];
    [self setUpChildVc:[[YTStoreViewController alloc]init] title:@"商城" image:[UIImage imageNamed:@"tabbarShop"] selectImage:[UIImage imageNamed:@"tabbarShopPre"]];
    [self setUpChildVc:[[YTMineViewController alloc]init] title:@"我的" image:[UIImage imageNamed:@"tabbarMine"] selectImage:[UIImage imageNamed:@"tabbarMinePre"]];

}

- (void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage {
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    YTNavigationViewController *nav = [[YTNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}


@end
