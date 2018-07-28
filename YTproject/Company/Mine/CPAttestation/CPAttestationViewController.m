//
//  CPAttestationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPAttestationViewController.h"
#import "CPLegalPersonViewController.h"

@interface CPAttestationViewController ()

@end

@implementation CPAttestationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
}
- (IBAction)next:(UIButton *)sender {
    CPLegalPersonViewController *vc = [[CPLegalPersonViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
