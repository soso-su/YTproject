//
//  CPBillMessageViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPBillMessageViewController.h"

@interface CPBillMessageViewController ()

@end

@implementation CPBillMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发票信息";
}



- (IBAction)comfirm:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
