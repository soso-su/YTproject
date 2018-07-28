//
//  YTNotificationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTNotificationViewController.h"
#import "YTPageViewController.h"
#import "YTNotificationListViewController.h"
#import "YTChatListViewController.h"
#import "CPChatMessageViewController.h"


@interface YTNotificationViewController ()<YTPageViewControllerDelegate>
@property (nonatomic ,strong) YTPageViewController *pageView;

@end

@implementation YTNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
//    YTChatListViewController *chatVc = [[YTChatListViewController alloc]init];
//    chatVc.title = @"会话消息";
    CPChatMessageViewController *chatVc = [[CPChatMessageViewController alloc]init];
    chatVc.title = @"会话消息";
    
    YTNotificationListViewController *sysVc = [[YTNotificationListViewController alloc]init];
    sysVc.title = @"系统消息";
    
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[chatVc,sysVc] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    self.pageView = pageView;
    pageView.delegate = self;
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}

- (void)didScrollToViewController:(UIViewController *)viewController index:(NSInteger)index{
    [self.pageView selectViewController:index];
}



@end
