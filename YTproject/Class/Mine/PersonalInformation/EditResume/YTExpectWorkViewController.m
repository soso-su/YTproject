//
//  YTExpectWorkViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTExpectWorkViewController.h"
#import "YTAddressViewController.h"
#import "YTSelectWorkTypeViewController.h"
#import "YTAddStatusCertificateViewController.h"

@interface YTExpectWorkViewController ()
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;
@property (weak, nonatomic) IBOutlet UIButton *thisMonth;
@property (weak, nonatomic) IBOutlet UIButton *oneMonth;
@property (weak, nonatomic) IBOutlet YTTouchView *selectWorkType;
@property (weak, nonatomic) IBOutlet YTTouchView *selectAddress;

@end

@implementation YTExpectWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑简历";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.weekBtn.selected = YES;
    self.selectWorkType.touchHandler = ^{
        YTSelectWorkTypeViewController *vc = [[YTSelectWorkTypeViewController alloc]init];
        vc.title = @"期望行业";
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    self.selectAddress.touchHandler = ^{
        YTAddressViewController *vc = [[YTAddressViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    };
}

- (void)preview{
    
}

- (IBAction)onWeek:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.thisMonth.selected = NO;
        self.oneMonth.selected = NO;
    }
}

- (IBAction)onMonth:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.weekBtn.selected = NO;
        self.oneMonth.selected = NO;
    }
}

- (IBAction)oneMonth:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.thisMonth.selected = NO;
        self.weekBtn.selected = NO;
    }
}
- (IBAction)next:(UIButton *)sender {
    YTAddStatusCertificateViewController *vc = [[YTAddStatusCertificateViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
