//
//  YTInputLogistcViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTInputLogistcViewController.h"

@interface YTInputLogistcViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation YTInputLogistcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"填写物流单";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(commit)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)commit{
    if (self.textField.text.length > 0) {
        self.callback(self.textField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
