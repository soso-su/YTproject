//
//  YTForgetPswdViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTForgetPswdViewController.h"
#define TimeCount 15

@interface YTForgetPswdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UITextField *codeTf;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *newpsdTf;
@property (weak, nonatomic) IBOutlet UITextField *comfirPwsdTF;

@end

@implementation YTForgetPswdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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

- (IBAction)save:(UIButton *)sender {
}

@end
