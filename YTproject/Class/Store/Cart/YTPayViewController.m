//
//  YTPayViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPayViewController.h"

@interface YTPayViewController ()
@property (weak, nonatomic) IBOutlet YTTouchView *zfbView;
@property (weak, nonatomic) IBOutlet UIButton *zfbBtn;
@property (weak, nonatomic) IBOutlet YTTouchView *wechatView;
@property (weak, nonatomic) IBOutlet UIButton *wechatBtn;

@property (weak, nonatomic) IBOutlet YTTouchView *bankCardView;
@property (weak, nonatomic) IBOutlet UIButton *bankCardBtn;

@end

@implementation YTPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付";
    [self setUpUI];
}

- (void)setUpUI{
    self.zfbView.touchHandler = ^{
        self.zfbBtn.selected = YES;
        self.wechatBtn.selected = NO;
        self.bankCardBtn.selected = NO;
    };
    
    self.wechatView.touchHandler = ^{
        self.zfbBtn.selected = NO;
        self.wechatBtn.selected = YES;
        self.bankCardBtn.selected = NO;
    };
    
    self.bankCardView.touchHandler = ^{
        self.zfbBtn.selected = NO;
        self.wechatBtn.selected = NO;
        self.bankCardBtn.selected = YES;
    };
}

- (IBAction)commit:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
