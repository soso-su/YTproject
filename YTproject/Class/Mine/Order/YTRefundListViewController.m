//
//  YTRefundListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRefundListViewController.h"
#import "YTRefundDetailViewController.h"
#import "RefundCell.h"

#define cellID @"REFUNDCELL"

@interface YTRefundListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *selectAllBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *comfirmBtn;
@property (assign, nonatomic) BOOL isSelectAll;

@end

@implementation YTRefundListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"选择售后商品";
    [self.tableView registerNib:[UINib nibWithNibName:@"RefundCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RefundCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.isSelectAll) {
        cell.selectBtn.selected = YES;
    }else{
        cell.selectBtn.selected = NO;
    }
    return cell;
}


- (IBAction)comfirm:(UIButton *)sender {
    YTRefundDetailViewController *refundVc = [[YTRefundDetailViewController alloc]init];
    [self.navigationController pushViewController:refundVc animated:YES];
}

- (IBAction)selectAll:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.isSelectAll = sender.selected;
    [self.tableView reloadData];
}

@end
