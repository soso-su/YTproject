//
//  YTCommitVCRViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCommitVCRViewController.h"
#import "YTResumeViewController.h"

@interface YTCommitVCRViewController ()

@end

@implementation YTCommitVCRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)commit:(UIButton *)sender {
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
