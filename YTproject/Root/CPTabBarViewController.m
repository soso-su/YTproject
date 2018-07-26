//
//  CPTabBarViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPTabBarViewController.h"
#import "YTNavigationViewController.h"
#import "CPWorkViewController.h"
#import "CPInformationViewController.h"
#import "CPMineViewController.h"

@interface CPTabBarViewController ()

@end

@implementation CPTabBarViewController

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
    
    
    [self setUpChildVc:[[CPWorkViewController alloc]init] title:@"工作" image:[UIImage imageNamed:@"tabbarWork"] selectImage:[UIImage imageNamed:@"tabbarWorkPre"]];
    
    [self setUpChildVc:[[CPInformationViewController alloc]init] title:@"消息" image:[UIImage imageNamed:@"tabbarChat"] selectImage:[UIImage imageNamed:@"tabbarMessagePre"]];
    
    [self setUpChildVc:[[CPMineViewController alloc]init] title:@"我的" image:[UIImage imageNamed:@"tabbarMine"] selectImage:[UIImage imageNamed:@"tabbarMinePre"]];
    
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
