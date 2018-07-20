//
//  YTOrderViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTOrderViewController.h"
#import "YTPageViewController.h"
#import "YTOrderListViewController.h"

@interface YTOrderViewController ()

@end

@implementation YTOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"我的订单";
    
    YTOrderListViewController *allStateVc = [[YTOrderListViewController alloc]init];
    allStateVc.title = @"全部";
    
    YTOrderListViewController *obligationVc = [[YTOrderListViewController alloc]init];
    obligationVc.title = @"待付款";
    
    YTOrderListViewController *sendGoodsVc = [[YTOrderListViewController alloc]init];
    sendGoodsVc.title = @"待发货";
    
    YTOrderListViewController *takeGoodsVc = [[YTOrderListViewController alloc]init];
    takeGoodsVc.title = @"待收货";
    
    YTOrderListViewController *evaluateVc = [[YTOrderListViewController alloc]init];
    evaluateVc.title = @"待评价";
    
    YTOrderListViewController *afterSaleVc = [[YTOrderListViewController alloc]init];
    afterSaleVc.title = @"售后后";
    
    YTOrderListViewController *otherVc = [[YTOrderListViewController alloc]init];
    otherVc.title = @"售后后";
    
    YTOrderListViewController *otherVc1 = [[YTOrderListViewController alloc]init];
    otherVc1.title = @"售后";
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[allStateVc,obligationVc,sendGoodsVc,takeGoodsVc,evaluateVc,afterSaleVc,otherVc,otherVc1] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}


@end
