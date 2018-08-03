//
//  YTAgreementViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAgreementViewController.h"

@interface YTAgreementViewController ()
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@end

@implementation YTAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务协议";
    self.msgLabel.text = self.msg;
}

- (void)setMsg:(NSString *)msg{
    _msg = msg;
}

@end
