//
//  YTPostFileViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPostFileViewController.h"
#import "SendfileCell.h"
#define cellID  @"fileCell"

@interface YTPostFileViewController ()<UITableViewDelegate,UITableViewDataSource,SendfileCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTPostFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"SendfileCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"发送简历";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    btn.frame = CGRectMake(0, 0, 35, 35);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SendfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)selectFile{
    
}

@end
