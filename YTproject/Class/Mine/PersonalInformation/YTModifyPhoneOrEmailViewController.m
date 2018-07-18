//
//  ModifyPhoneOrEmailViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTModifyPhoneOrEmailViewController.h"

@interface YTModifyPhoneOrEmailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *vertificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *vertificationButton;

@property (nonatomic,assign)ModifyType type;
@property (nonatomic,assign)NSInteger countDownTime;
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation YTModifyPhoneOrEmailViewController

-(instancetype)initWithType:(ModifyType)type{
    self = [super init];
    
    if (self) {
        self.type = type;
        self.countDownTime = 60;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (self.timer) {
        [self.timer invalidate];
    }
}
//倒计时
- (void)countDown{
    
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    
    self.countDownTime--;
    [self.vertificationButton setTitle:[NSString stringWithFormat:@"%ld",self.countDownTime] forState:UIControlStateNormal];
    
    if (self.countDownTime == 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.countDownTime = 60;
        [self.vertificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    
}

#pragma mark =======================ActionEvent=========================
- (IBAction)getVertificationCode:(UIButton *)sender {
    [self countDown];
}

- (IBAction)bind:(UIButton *)sender {
}

#pragma mark =======================Setup=========================
- (void)setupView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.type) {
        case ModifyEmail:
            self.accountTextField.placeholder = @"输入邮箱账号";
            break;
        default:
            self.accountTextField.placeholder = @"输入新手机号";
            break;
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 23)];
    [button setImage:[UIImage imageNamed:@"loginIconPhone"] forState:UIControlStateNormal];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 6);
    button.centerY = self.accountTextField.height/2;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(button.width, 0, 1, self.accountTextField.height - 10)];
    lineView.backgroundColor = RGB(229, 229, 229);
    lineView.centerY = self.accountTextField.height/2;
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, button.width + lineView.width, self.accountTextField.height)];
    
    [leftView addSubview:button];
    [leftView addSubview:lineView];
    
    self.accountTextField.leftView = leftView;
    self.accountTextField.leftViewMode = UITextFieldViewModeAlways;
}

@end
