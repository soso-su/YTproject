//
//  YTRegisterViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRegisterViewController.h"
#define TimeCount 15

@interface YTRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pswdTF;
@property (weak, nonatomic) IBOutlet UITextField *comfirTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *companyBtn;

@property (weak, nonatomic) IBOutlet UIButton *personBtn;


@end

@implementation YTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.companyBtn.selected = YES;
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
                [sender setTitle:[NSString stringWithFormat:@"%lds",second] forState:UIControlStateNormal];
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
    }
}

- (IBAction)selectPerson:(UIButton *)sender {
    if (!sender.selected){
        self.companyBtn.selected = NO;
        sender.selected = YES;
    }
}

- (IBAction)registerUser:(UIButton *)sender {
}
- (IBAction)readProtocol:(UIButton *)sender {
}

@end
