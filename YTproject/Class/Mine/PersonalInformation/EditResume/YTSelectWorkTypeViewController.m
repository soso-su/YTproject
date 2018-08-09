//
//  YTSelectWorkTypeViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSelectWorkTypeViewController.h"
#import "SelectEducationView.h"

@interface YTSelectWorkTypeViewController ()

@end

@implementation YTSelectWorkTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
//    rightItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    SelectEducationView *edVc = [[SelectEducationView alloc]initWithFrame:self.view.bounds];
    edVc.typeModel = self.typeModel;
    edVc.controller = self;
    [self.view addSubview:edVc];
}

//- (void)save{
//    [self.navigationController popViewControllerAnimated:YES];
//}

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
