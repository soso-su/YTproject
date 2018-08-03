//
//  YTCommitVCRViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCommitVCRViewController.h"
#import "YTFileDetailsViewController.h"
#import "YTResumeViewController.h"

@interface YTCommitVCRViewController ()

@end

@implementation YTCommitVCRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;

    // Do any additional setup after loading the view from its nib.
}


- (IBAction)commit:(UIButton *)sender {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[YTFileDetailsViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
//    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)preview{
    
}

@end
