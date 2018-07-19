//
//  YTCartAddAddressViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCartAddAddressViewController.h"

@interface YTCartAddAddressViewController ()

@end

@implementation YTCartAddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)setDefault:(UIButton *)sender {
    sender.selected = !sender.selected;
}



@end
