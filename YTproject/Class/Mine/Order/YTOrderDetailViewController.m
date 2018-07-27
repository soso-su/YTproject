//
//  YTOrderDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTOrderDetailViewController.h"
#import "AffirmOrderCell.h"
#import "OrderDetailHeadView.h"
#import "OrderDetailFooterView.h"
#import "OrderTipcView.h"
#import "YTOrderEvaluateListController.h"
#import "YTLogisticsViewController.h"
#import "YTRefundListViewController.h"

#define cellID @"rmOrderCell"

@interface YTOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource,OrderDetailFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)OrderDetailHeadView *headView;
@property (nonatomic, strong)OrderDetailFooterView *footerView;

@end

@implementation YTOrderDetailViewController

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

- (void)giveupOrder:(OrderListModel *)model{
    if (model.orderState == OrderState_NotTake) {
        YTLogisticsViewController *logist = [[YTLogisticsViewController alloc]init];
        [self.navigationController pushViewController:logist animated:YES];
    }else{
        [OrderTipcView showWithStr:@"提示：您将取消该订单" type:TextCenter callBack:^{
            
        }];
    }
    
}

- (void)payOrder:(OrderListModel *)model{
    if (model.orderState == OrderState_NotSend) {
        [OrderTipcView showWithStr:@"申请退款，订单金额将直接退回您的支付账户。" type:TextLeft callBack:^{
            
        }];
    }else if (model.orderState == OrderState_NotEvaluate){
        YTOrderEvaluateListController *evaluateVc = [[YTOrderEvaluateListController alloc]init];
        [self.navigationController pushViewController:evaluateVc animated:YES];
    }else if (model.orderState == OrderState_NotTake){
        [OrderTipcView showWithStr:@"请确认已经收到宝贝，否则可能财物两空！" type:TextLeft callBack:^{
            
        }];
    }
}

- (void)refundOrder:(OrderListModel *)model{
    YTRefundListViewController *fundVc = [[YTRefundListViewController alloc]init];
    [self.navigationController pushViewController:fundVc animated:YES];
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
