//
//  YTLoginViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLoginViewController.h"
#import "YTSelectViewController.h"
#import "YTTabBarViewController.h"
#import "CPTabBarViewController.h"

@interface YTLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswdTextField;

@end

@implementation YTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)login:(UIButton *)sender {
    if ([self.userTextField.text isEqualToString:@"1"]) {
        YTTabBarViewController *tabVc = [[YTTabBarViewController alloc]init];
        [YTTool getWindow].rootViewController = tabVc;
    }else if ([self.userTextField.text isEqualToString:@"2"]){
        CPTabBarViewController *tabVc = [[CPTabBarViewController alloc]init];
        [YTTool getWindow].rootViewController = tabVc;
    }else{
        [YTProgressHUD showErrorWithStr:@"请输入正确的账号密码"];
    }
}

- (IBAction)newUser:(UIButton *)sender {
    YTSelectViewController *newVc = [[YTSelectViewController alloc]init];
    newVc.type = 0;
    [self.navigationController pushViewController:newVc animated:YES];
}

- (IBAction)forgetPswd:(UIButton *)sender {
    YTSelectViewController *forgetVc = [[YTSelectViewController alloc]init];
    forgetVc.type = 1;
    [self.navigationController pushViewController:forgetVc animated:YES];
}

- (IBAction)facebook:(UIButton *)sender {
}

- (IBAction)Ins:(UIButton *)sender {
}

- (IBAction)wechat:(UIButton *)sender {
}

- (IBAction)qq:(UIButton *)sender {
}


@end
