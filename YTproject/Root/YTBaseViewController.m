//
//  YTBaseViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"

@interface YTBaseViewController ()

@end

@implementation YTBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpNav];
        
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibNameOrNil];
    if (self) {
        [self setUpNav];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpNav];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(238, 238, 238);
    
}


- (void)setUpNav {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customItem;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}



- (CGFloat)stateHeight{
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    return statusRect.size.height;
}

- (CGFloat)stateBarAndNavBarHeight{
    CGFloat navHeight = 0;
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    UIWindow *window = [YTTool getWindow];
    UIViewController *viewController = window.rootViewController;
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)viewController;
        navHeight = nav.navigationBar.frame.size.height;
    }
    
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabVc = (UITabBarController *)viewController;
        UIViewController *selectVc = tabVc.selectedViewController;
        if ([selectVc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)selectVc;
            navHeight = nav.navigationBar.frame.size.height;
        }
    }
    return statusRect.size.height + navHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    YTLog(@"%@ dealloc  💕 ",NSStringFromClass([self class]));
}


@end
