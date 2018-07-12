//
//  YTSelectViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSelectViewController.h"
#import <SGPagingView.h>
#import "YTRegisterViewController.h"
#import "YTForgetPswdViewController.h"

@interface YTSelectViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;
@end

@implementation YTSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpPageView];
}

- (void)setUpPageView{
    CGFloat indicatorWidth = 10;
    CGFloat titleViewH = 54;
    
    NSString *leftStr = @"手机注册";
    NSString *rightStr = @"邮件注册";
    UIViewController *leftVc;
    UIViewController *rightVc;
    
    if (self.type == 0){
        leftStr = @"手机注册";
        rightStr = @"邮件注册";
        self.title = @"注册";
        
        YTRegisterViewController *phoneVc = [[YTRegisterViewController alloc]init];
        phoneVc.type = 0;
        leftVc = phoneVc;
        YTRegisterViewController *mailVc = [[YTRegisterViewController alloc]init];
        mailVc.type = 1;
        rightVc = mailVc;
        
    }else if (self.type == 1){
        leftStr = @"手机验证";
        rightStr = @"邮件验证";
        self.title = @"找回密码";
        YTForgetPswdViewController *phoneVc = [[YTForgetPswdViewController alloc]init];
        phoneVc.type = 0;
        leftVc = phoneVc;
        YTForgetPswdViewController *mailVc = [[YTForgetPswdViewController alloc]init];
        mailVc.type = 1;
        rightVc = mailVc;
        
    }else{
        leftStr = @"绑定手机";
        rightStr = @"绑定邮件";
    }
    
    NSArray *titleArr = @[leftStr, rightStr];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = DefaultColor;
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width, titleViewH) delegate:self titleNames:titleArr configure:configure];
    self.pageTitleView.selectedIndex = 0;
    [self.view addSubview:_pageTitleView];
    
    
    NSArray *controlArray = @[leftVc,rightVc];
    CGFloat contentViewHeight = kScreen_Height - self.pageTitleView.height;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), kScreen_Width, contentViewHeight) parentVC:self childVCs:controlArray];
    self.pageContentView.delegatePageContentScrollView = self;
    [self.view addSubview:self.pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}



@end
