//
//  CPWaitAuditViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPWaitAuditViewController.h"
#import "CPMineViewController.h"

@interface CPWaitAuditViewController ()

@end

@implementation CPWaitAuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
    [self setUpNav];
}

- (void)setUpNav {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customItem;
}

- (void)back {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[CPMineViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}



@end
