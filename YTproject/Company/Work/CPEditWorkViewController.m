//
//  CPEditWorkViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPEditWorkViewController.h"
#import "YTDatePickerView.h"
#import "YTAlertView.h"
#import "YTSelectWorkTypeViewController.h"

@interface CPEditWorkViewController ()
@property (weak, nonatomic) IBOutlet YTTouchView *timeView;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet YTTouchView *workTypeView;
@property (weak, nonatomic) IBOutlet YTTouchView *educationView;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;

@end

@implementation CPEditWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}


- (void)setUpUI{
    self.title = @"职业详情";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.timeTextField.enabled = NO;
    self.timeView.touchHandler = ^{
        NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
        [fmt setDateFormat:@"yyyy-MM-dd"];
        NSDate *defaultDate = [fmt dateFromString:@"2018-05-20"];
        [YTDatePickerView showWithDefaultSelectDate:defaultDate SelectBlock:^(NSDate *date) {

        }];
    };
    
    self.educationTextField.enabled = NO;
    self.educationView.touchHandler = ^{
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"大专",@"其他",nil];
        [alertView show];
    };
    
    self.workTypeView.touchHandler = ^{
        YTSelectWorkTypeViewController *workVc = [[YTSelectWorkTypeViewController alloc]init];
        [self.navigationController pushViewController:workVc animated:YES];
    };
    
}

- (void)save{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
