//
//  CPApplicantViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPApplicantViewController.h"
#import "YTPageViewController.h"
#import "CPApplicantListViewController.h"

@interface CPApplicantViewController ()<YTPageViewControllerDelegate>
@property(nonatomic, strong)YTPageViewController *pageView;

@end

@implementation CPApplicantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"应聘者";
    CPApplicantListViewController *allVc = [[CPApplicantListViewController alloc]init];
    allVc.title = @"全部";
    allVc.isEducation = self.isEducation;
    
    CPApplicantListViewController *Vc = [[CPApplicantListViewController alloc]init];
    Vc.title = @"待面试";
    Vc.isEducation = self.isEducation;
    
    CPApplicantListViewController *Vc1 = [[CPApplicantListViewController alloc]init];
    Vc1.title = @"感兴趣";
    Vc1.isEducation = self.isEducation;
    
    CPApplicantListViewController *Vc2 = [[CPApplicantListViewController alloc]init];
    Vc2.title = @"已面试";
    Vc2.isEducation = self.isEducation;
    
    CPApplicantListViewController *Vc3 = [[CPApplicantListViewController alloc]init];
    Vc3.title = @"通过面试";
    Vc3.isEducation = self.isEducation;
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[allVc,Vc,Vc1,Vc2,Vc3] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    pageView.delegate = self;
    self.pageView = pageView;
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}

- (void)didScrollToViewController:(UIViewController *)viewController index:(NSInteger)index{
    [self.pageView selectViewController:index];
}

@end
