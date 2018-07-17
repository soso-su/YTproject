//
//  ModifyPhoneOrEmailViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ModifyPhoneOrEmailViewController.h"

@interface ModifyPhoneOrEmailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *vertificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *vertificationButton;
@property (nonatomic,assign)ModifyType type;

@end

@implementation ModifyPhoneOrEmailViewController

-(instancetype)initWithType:(ModifyType)type{
    self = [super init];
    
    if (self) {
        self.type = type;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
}

#pragma mark =======================ActionEvent=========================
- (IBAction)getVertificationCode:(UIButton *)sender {
}

- (IBAction)bind:(UIButton *)sender {
}

#pragma mark =======================Setup=========================
- (void)setupView{
    
    switch (self.type) {
        case ModifyEmail:
            self.accountTextField.placeholder = @"输入邮箱账号";
            break;
        default:
            self.accountTextField.placeholder = @"输入新手机号";
            break;
    }
    
    CGFloat margin = 6;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginIconPhone"]];
    [imageView sizeToFit];
    imageView.centerY = self.accountTextField.height/2;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(imageView.width + margin, 0, 1, self.accountTextField.height - 4)];
    lineView.centerY = self.accountTextField.height/2;
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, imageView.width + margin + lineView.width, self.accountTextField.height)];
    
    [leftView addSubview:imageView];
    [leftView addSubview:lineView];
    
    self.accountTextField.leftView = leftView;
    self.accountTextField.leftViewMode = UITextFieldViewModeAlways;
}

@end
