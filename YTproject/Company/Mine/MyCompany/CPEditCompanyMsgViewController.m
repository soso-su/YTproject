//
//  CPEditCompanyMsgViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPEditCompanyMsgViewController.h"

@interface CPEditCompanyMsgViewController ()

@end

@implementation CPEditCompanyMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入公司简介和标签";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(comfirm)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)comfirm{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
