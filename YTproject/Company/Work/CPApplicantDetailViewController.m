//
//  CPApplicantDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPApplicantDetailViewController.h"
#import "CPResumeViewController.h"

@interface CPApplicantDetailViewController ()
@property (weak, nonatomic) IBOutlet YTTouchView *checkResume;
@property (weak, nonatomic) IBOutlet YTTouchView *attestationView;

@end

@implementation CPApplicantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应聘者个人主页";
    self.checkResume.touchHandler = ^{
        CPResumeViewController *resum = [[CPResumeViewController alloc]init];
        [self.navigationController pushViewController:resum animated:YES];
    };
    
    self.attestationView.touchHandler = ^{
        CPResumeViewController *resum = [[CPResumeViewController alloc]init];
        [self.navigationController pushViewController:resum animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
