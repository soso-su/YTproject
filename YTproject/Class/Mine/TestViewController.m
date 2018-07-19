//
//  TestViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "TestViewController.h"
#import "YTResumeViewController.h"
#import "YTPageViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    YTResumeViewController *vc1 = [[YTResumeViewController alloc]init];
    vc1.title = @"简历1";
    
    YTResumeViewController *vc2 = [[YTResumeViewController alloc]init];
    vc2.title = @"简历2";
    
    YTResumeViewController *vc3 = [[YTResumeViewController alloc]init];
    vc3.title = @"简历3";
    
    YTResumeViewController *vc4 = [[YTResumeViewController alloc]init];
    vc4.title = @"简历4";
    
    YTResumeViewController *vc5 = [[YTResumeViewController alloc]init];
    vc5.title = @"简历5";
    
    YTResumeViewController *vc6 = [[YTResumeViewController alloc]init];
    vc6.title = @"简历6";
    
    YTResumeViewController *vc7 = [[YTResumeViewController alloc]init];
    vc7.title = @"简历7";
    
    NSArray *vcs = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    
    YTPageViewController *pageVc = [YTPageViewController pageWithViewControllers:vcs configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    [self addChildViewController:pageVc];
    
    pageVc.view.frame = self.view.bounds;
    [self.view addSubview:pageVc.view];
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
