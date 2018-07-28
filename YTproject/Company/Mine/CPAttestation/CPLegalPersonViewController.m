//
//  CPLegalPersonViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPLegalPersonViewController.h"
#import "CPBusinessViewController.h"

@interface CPLegalPersonViewController ()

@end

@implementation CPLegalPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
}

- (IBAction)next:(UIButton *)sender {
    CPBusinessViewController *vc = [[CPBusinessViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
