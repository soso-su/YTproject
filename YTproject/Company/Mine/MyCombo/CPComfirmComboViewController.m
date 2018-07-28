//
//  CPComfirmComboViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPComfirmComboViewController.h"
#import "CPBillMessageViewController.h"

@interface CPComfirmComboViewController ()
@property (weak, nonatomic) IBOutlet UIButton *zfbBtn;
@property (weak, nonatomic) IBOutlet UIButton *wechatBtn;

@property (weak, nonatomic) IBOutlet YTTouchView *billView;
@property (weak, nonatomic) IBOutlet YTTouchView *zfbView;
@property (weak, nonatomic) IBOutlet YTTouchView *wechatView;

@end

@implementation CPComfirmComboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确定套餐";
    [self setUpUI];
}

- (void)setUpUI{
    self.zfbBtn.selected = YES;
    self.billView.touchHandler = ^{
        CPBillMessageViewController *vc = [[CPBillMessageViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    self.zfbView.touchHandler = ^{
        self.zfbBtn.selected = YES;
        self.wechatBtn.selected = NO;
    };
    
    self.wechatView.touchHandler = ^{
        self.zfbBtn.selected = NO;
        self.wechatBtn.selected = YES;
    };
}

- (IBAction)pay:(UIButton *)sender {
}



@end
