//
//  YTAddStatusCertificateViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAddStatusCertificateViewController.h"
#import "YTCommitVCRViewController.h"
#import "YTResumeViewController.h"

@interface YTAddStatusCertificateViewController ()

@end

@implementation YTAddStatusCertificateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑简历";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (IBAction)next:(UIButton *)sender {
    YTCommitVCRViewController *vc = [[YTCommitVCRViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
