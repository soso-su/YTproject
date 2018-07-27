//
//  YTRefundDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRefundDetailViewController.h"
#import "AffirmOrderCell.h"
#import "OrderDetailHeadView.h"
#import "OrderDetailFooterView.h"
#import "OrderTipcView.h"
#import "YTApplyforViewController.h"

#define cellID @"OrderCell"

@interface YTRefundDetailViewController ()<UITableViewDelegate,UITableViewDataSource,OrderDetailFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)OrderDetailHeadView *headView;
@property (nonatomic, strong)OrderDetailFooterView *footerView;
@end

@implementation YTRefundDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"订单详情";
    [self.tableView registerNib:[UINib nibWithNibName:@"AffirmOrderCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.headView.model = self.model;
    self.tableView.tableHeaderView = self.headView;
    self.footerView.showMsg = @"订单号：2346348415238798\n\n创建时间：2017-10-28   12:25\n\n支付时间：2017-10-28   12:25\n\n发货时间：2017-10-28   12:25";
    self.footerView.isRefund = YES;
    self.footerView.model = self.model;
    self.tableView.tableFooterView = self.footerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AffirmOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isCart = NO;
    return cell;
}

- (void)commitOrder:(OrderListModel *)model{
    YTApplyforViewController *applyVc = [[YTApplyforViewController alloc]init];
    [self.navigationController pushViewController:applyVc animated:YES];
}

- (OrderDetailHeadView *)headView{
    if (!_headView) {
        _headView = [OrderDetailHeadView showDetailHeadView];
    }
    return _headView;
}

- (OrderDetailFooterView *)footerView{
    if (!_footerView) {
        _footerView = [OrderDetailFooterView showDetailFooterView];
        _footerView.delegate = self;
    }
    return _footerView;
}


@end
