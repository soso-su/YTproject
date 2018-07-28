//
//  CPWorkDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPWorkDetailViewController.h"
#import "CPEditWorkViewController.h"

@interface CPWorkDetailViewController ()

@end

@implementation CPWorkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"职业详情";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)edit{
    CPEditWorkViewController *editVc = [[CPEditWorkViewController alloc]init];
    editVc.title = @"职业详情";
    [self.navigationController pushViewController:editVc animated:YES];
}

@end
