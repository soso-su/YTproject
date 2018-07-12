//
//  YTWorkSearchTableViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/8.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkSearchTableViewController.h"
#import "WorkTableViewCell.h"
#import "YTCompanyViewController.h"
#define CellID @"SearchTableViewCell"

@interface YTWorkSearchTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTWorkSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"WorkTableViewCell" bundle:nil] forCellReuseIdentifier:CellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (self.type == 100) {
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.type == 100) {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.bgView.layer.borderWidth = 1.0;
        cell.bgView.layer.borderColor = RGB(230, 230, 230).CGColor;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTCompanyViewController *company = [[YTCompanyViewController
                                         alloc]init];
    [self.navigationController pushViewController:company animated:YES];
}

@end
