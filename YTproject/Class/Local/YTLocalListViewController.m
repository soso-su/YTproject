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
#define cellID @"ListCell"

@interface YTLocalListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTLocalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"LocalListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
