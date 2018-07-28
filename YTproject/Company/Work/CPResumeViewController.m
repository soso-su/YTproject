//
//  CPResumeViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPResumeViewController.h"
#import "CPInviteViewController.h"

@interface CPResumeViewController ()

@end

@implementation CPResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简历详情";
}

- (IBAction)invite:(UIButton *)sender {
    CPInviteViewController *inviteVc = [[CPInviteViewController alloc]init];
    [self.navigationController pushViewController:inviteVc animated:YES];
}


@end
