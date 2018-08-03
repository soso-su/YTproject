//
//  YTRegisterViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRegisterViewController.h"
#import "YTShowStateView.h"
#import "YTAgreementViewController.h"
#define TimeCount 15

@interface YTRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pswdTF;
@property (weak, nonatomic) IBOutlet UITextField *comfirTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *companyBtn;

@property (weak, nonatomic) IBOutlet UIButton *personBtn;

@property (assign, nonatomic) NSInteger accounType;


@end

@implementation YTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.companyBtn.selected = YES;
    self.accounType = 1;
    if(self.type == 0){
        self.phoneTF.placeholder = @"输入手机号";
    }else{
        self.phoneTF.placeholder = @"输入邮箱";
    }
}

- (IBAction)getCode:(UIButton *)sender {
    __block NSInteger second = TimeCount;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1*NSEC_PER_SEC, 0*NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (second == 0){
                sender.userInteractionEnabled = YES;
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                second = TimeCount;
                dispatch_cancel(timer);
            }else{

                sender.userInteractionEnabled = NO;
                [sender setTitle:[NSString stringWithFormat:@"%zds",second] forState:UIControlStateNormal];
                second--;
            }
        });
    });
    dispatch_resume(timer);
}

- (IBAction)selectCompany:(UIButton *)sender {
    if (!sender.selected){
        self.personBtn.selected = NO;
        sender.selected = YES;
        self.accounType = 1;
    }
}

- (IBAction)selectPerson:(UIButton *)sender {
    if (!sender.selected){
        self.companyBtn.selected = NO;
        sender.selected = YES;
        self.accounType = 0;
    }
}

- (IBAction)registerUser:(UIButton *)sender {
    if (self.phoneTF.text.length <= 0) {
        [YTProgressHUD showErrorWithStr:@"请输入账号"];
        return;
    }
    
    if (self.pswdTF.text.length <= 0) {
        [YTProgressHUD showErrorWithStr:@"请输入密码"];
        return;
    }
    
    if (self.comfirTF.text.length <= 0) {
        [YTProgressHUD showErrorWithStr:@"请确认密码"];
        return;
    }
    
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [self registerUserWithAccount:self.phoneTF.text password:self.pswdTF.text comfirmPassword:self.comfirTF.text type:self.type accountType:self.accounType];
}
- (IBAction)readProtocol:(UIButton *)sender {
    [self agreement];
}


#pragma mark -------------HttpRequest

/**
 注册接口

 @param account 账号
 @param password 密码
 @param comfirmPassword 确认密码
 @param type 类型 0个人 1公司
 @param account_type 注册账号类型0手机1邮箱
 */
- (void)registerUserWithAccount:(NSString *)account password:(NSString *)password comfirmPassword:(NSString *)comfirmPassword type:(NSInteger)type accountType:(NSInteger)account_type{
    NSDictionary *dict = @{
                           @"account":account,
                           @"password":password,
                           @"password1":comfirmPassword,
                           @"type":@(type),
                           @"account_type":@(account_type)
                           };
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTRegisterUrl requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            [YTProgressHUD dismissHUD];
            if ([responseObject[YTCode] integerValue] == 2000) {
                [YTShowStateView showStateViewWithStr:@"注册成功" textColor:RGB(51, 51, 51)];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [YTShowStateView showStateViewWithStr:responseObject[YTMsg] textColor:DefaultColor];
            }
            
        } @catch (NSException *exception) {
            [YTShowStateView showStateViewWithStr:@"注册失败，请稍后重试！" textColor:DefaultColor];
            YTLog(@"registerUser exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTShowStateView showStateViewWithStr:@"注册失败，请稍后重试！" textColor:DefaultColor];
        YTLog(@"registerUser error = %@",error);
    }];
}



/**
 注册协议接口
 */
- (void)agreement{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTAgreementUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        @try {
            if ([responseObject[YTCode] integerValue] == 2000) {
                [YTProgressHUD dismissHUD];
                YTAgreementViewController *vc = [[YTAgreementViewController alloc]init];
                vc.msg = responseObject[@"agreement"][@"connent"];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
        } @catch (NSException *exception) {
            [YTShowStateView showStateViewWithStr:YTHttpState_RequestCatch textColor:DefaultColor];
        }
    } failure:^(NSError *error) {
        [YTShowStateView showStateViewWithStr:YTHttpState_RequestFail textColor:DefaultColor];
        YTLog(@"registerUser error = %@",error);
    }];
}


@end
