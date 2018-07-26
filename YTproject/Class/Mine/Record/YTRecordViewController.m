//
//  YTRecordViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRecordViewController.h"
#import "YTPageViewController.h"
#import "YTRecordListViewController.h"

@interface YTRecordViewController ()<YTPageViewControllerDelegate>

@property (nonatomic ,strong) YTPageViewController *pageView;
@end

@implementation YTRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投递记录";
    YTRecordListViewController *allVc = [[YTRecordListViewController alloc]init];
    allVc.vcState = VcState_All;
    allVc.title = @"全部";
    
    YTRecordListViewController *checkVc = [[YTRecordListViewController alloc]init];
    checkVc.vcState = VcState_Check;
    checkVc.title = @"被查看";
    
    YTRecordListViewController *interestVc = [[YTRecordListViewController alloc]init];
    interestVc.vcState = VcState_Interest;
    interestVc.title = @"有兴趣";
    
    YTRecordListViewController *makeInterviewVc = [[YTRecordListViewController alloc]init];
    makeInterviewVc.vcState = VcState_MakeInterview;
    makeInterviewVc.title = @"约面试";
    
    YTRecordListViewController *passInterviewVc = [[YTRecordListViewController alloc]init];
    passInterviewVc.vcState = VcState_PassInterview;
    passInterviewVc.title = @"通过面试";
    
    YTRecordListViewController *vetoVc = [[YTRecordListViewController alloc]init];
    vetoVc.vcState = VcState_NoFit;
    vetoVc.title = @"不合适";
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[allVc,checkVc,interestVc,makeInterviewVc,passInterviewVc,vetoVc] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
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
