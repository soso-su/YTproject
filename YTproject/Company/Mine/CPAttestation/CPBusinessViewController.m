//
//  CPBusinessViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPBusinessViewController.h"
#import "CPWaitAuditViewController.h"

@interface CPBusinessViewController ()

@end

@implementation CPBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
}

- (IBAction)commit:(UIButton *)sender {
    CPWaitAuditViewController *vc = [[CPWaitAuditViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
