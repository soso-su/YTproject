//
//  YTNameAttestationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTNameAttestationViewController.h"
#import "YTPassAttextationViewController.h"

@interface YTNameAttestationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UIButton *personMessageButton;

@property (weak, nonatomic) IBOutlet UIButton *visaButton;


@end

@implementation YTNameAttestationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
    
}

- (IBAction)personMessage:(UIButton *)sender {
}

- (IBAction)visa:(UIButton *)sender {
}
- (IBAction)commit:(UIButton *)sender {
    YTPassAttextationViewController *passVc = [[YTPassAttextationViewController alloc]init];
    [self.navigationController pushViewController:passVc animated:YES];
}


@end
