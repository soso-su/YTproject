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
#import "YTShowStateView.h"

#define User @"User_name"
#define Pswd @"User_pswd"


@interface YTLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswdTextField;

@end

@implementation YTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.userTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:User];
    self.pswdTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:Pswd];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


- (IBAction)login:(UIButton *)sender {
    if ([self.userTextField.text isEqualToString:@"1"]) {
        YTTabBarViewController *vc = [[YTTabBarViewController alloc]init];
        [YTTool getWindow].rootViewController = vc;
    }else{
        CPTabBarViewController *vc = [[CPTabBarViewController alloc]init];
        [YTTool getWindow].rootViewController = vc;
    }
//    if (self.userTextField.text.length <= 0) {
//        [YTShowStateView showStateViewWithStr:@"请输入账号" textColor:DefaultColor];
//        return;
//    }
//
//    if (self.pswdTextField.text.length <= 0) {
//        [YTShowStateView showStateViewWithStr:@"请输入密码" textColor:DefaultColor];
//        return;
//    }
//
    
    
//    [self loginWithAccount:self.userTextField.text password:self.pswdTextField.text];
    
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


#pragma mark ------------HttpRequest


/**
 登陆接口

 @param account 用户名
 @param password 密码
 */
- (void)loginWithAccount:(NSString *)account password:(NSString *)password{
    NSDictionary *dict = @{
                           @"account":account,
                           @"password":password
                           };
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTLoginUrl requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            if ([responseObject[YTCode] integerValue] == 2000) {
                [[NSUserDefaults standardUserDefaults] setObject:account forKey:User];
                [[NSUserDefaults standardUserDefaults] setObject:password forKey:Pswd];
                [YTProgressHUD dismissHUD];
                BOOL isYY = [[YTUserModel share] yy_modelSetWithJSON:responseObject];
                if (isYY) {
                    YTUserModel *model = [YTUserModel share];
                    if (model.type == 0) {
                        YTTabBarViewController *vc = [[YTTabBarViewController alloc]init];
                        [YTTool getWindow].rootViewController = vc;
                    }else{
                        CPTabBarViewController *vc = [[CPTabBarViewController alloc]init];
                        [YTTool getWindow].rootViewController = vc;
                    }
                }
            }else{
                [YTProgressHUD dismissHUD];
                [YTShowStateView showStateViewWithStr:responseObject[YTMsg] textColor:DefaultColor];
            }
        } @catch (NSException *exception) {
            [YTProgressHUD dismissHUD];
            YTLog(@"login exception = %@",exception.description);
            [YTShowStateView showStateViewWithStr:@"登录失败，请稍后再试" textColor:DefaultColor];
        }
    } failure:^(NSError *error) {
        [YTProgressHUD dismissHUD];
        [YTShowStateView showStateViewWithStr:@"登录失败，请检查网络" textColor:DefaultColor];
    }];
}


@end
