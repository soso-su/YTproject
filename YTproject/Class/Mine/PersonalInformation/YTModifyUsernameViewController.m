//
//  YTModifyUsernameViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTModifyUsernameViewController.h"

@interface YTModifyUsernameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@end

@implementation YTModifyUsernameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(ensure)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)ensure{
    
}

@end
