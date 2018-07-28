//
//  CPInformationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPInformationViewController.h"
#import "YTPageViewController.h"
#import "YTChatListViewController.h"
#import "YTNotificationListViewController.h"

@interface CPInformationViewController ()<YTPageViewControllerDelegate>
@property(nonatomic, strong)YTPageViewController *pageView;

@end

@implementation CPInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    YTChatListViewController *chatVc = [[YTChatListViewController alloc]init];
    chatVc.title = @"会话消息";
    
    YTNotificationListViewController *sysVc = [[YTNotificationListViewController alloc]init];
    sysVc.isCompany = YES;
    sysVc.title = @"系统消息";
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[chatVc,sysVc] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    pageView.delegate = self;
    self.pageView = pageView;
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBarHidden = NO;
}

@end
