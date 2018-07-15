//
//  YTLocalListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/13.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLocalListViewController.h"
#import "YTActiveDetailsViewController.h"
#import "LocalListCell.h"
#import "CustomButton.h"
#define cellID @"ListCell"

@interface YTLocalListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTLocalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    
    CGFloat margin = 20;
    [self.tableView registerNib:[UINib nibWithNibName:@"LocalListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    CustomButton *newBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    newBtn.type = 2;
    [newBtn setTitle:@"最新" forState:UIControlStateNormal];
    [newBtn setImage:[UIImage imageNamed:@"localIconArrows"] forState:UIControlStateNormal];
    [newBtn sizeToFit];
    newBtn.frame = CGRectMake(headView.width - margin - newBtn.width, 0, newBtn.width, newBtn.height);
    [headView addSubview:newBtn];
    newBtn.centerY = headView.height/2;
    
    CustomButton *hotBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    hotBtn.type = 2;
    [hotBtn setTitle:@"热度" forState:UIControlStateNormal];
    [hotBtn setImage:[UIImage imageNamed:@"localIconArrowsPre"] forState:UIControlStateNormal];
    [hotBtn setTitleColor:DefaultColor forState:UIControlStateNormal];
    [hotBtn sizeToFit];
    hotBtn.frame = CGRectMake(headView.width - margin - hotBtn.width - newBtn.width - 10, 0, hotBtn.width, hotBtn.height);
    [headView addSubview:hotBtn];
    hotBtn.centerY = headView.height/2;
    
    self.tableView.tableHeaderView = headView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocalListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTActiveDetailsViewController *active = [[YTActiveDetailsViewController alloc]init];
    [self.navigationController pushViewController:active animated:YES];
}

@end
