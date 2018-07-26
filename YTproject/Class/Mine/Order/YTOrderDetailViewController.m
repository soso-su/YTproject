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

@interface YTOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource,OrderDetailFooterViewDelegate,OrderTipcViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)OrderDetailHeadView *headView;
@property (nonatomic, strong)OrderDetailFooterView *footerView;
@property (nonatomic,strong) OrderTipcView *tipcView;

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
    [[YTTool getWindow] addSubview:self.tipcView];
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
        
        self.tipcView.hidden = NO;
        self.tipcView.type = TextCenter;
        self.tipcView.showStr = @"提示：您将取消该订单";
    }
    
}

- (void)payOrder:(OrderListModel *)model{
    if (model.orderState == OrderState_NotSend) {
        self.tipcView.hidden = NO;
        self.tipcView.type = TextLeft;
        self.tipcView.showStr = @"申请退款，订单金额将直接退回您的支付账户。";
    }else if (model.orderState == OrderState_NotEvaluate){
        YTOrderEvaluateListController *evaluateVc = [[YTOrderEvaluateListController alloc]init];
        [self.navigationController pushViewController:evaluateVc animated:YES];
    }else if (model.orderState == OrderState_NotTake){
        self.tipcView.hidden = NO;
        self.tipcView.type = TextLeft;
        self.tipcView.showStr = @"请确认已经收到宝贝，否则可能财物两空！";
    }
}

- (void)refundOrder:(OrderListModel *)model{
    YTRefundListViewController *fundVc = [[YTRefundListViewController alloc]init];
    [self.navigationController pushViewController:fundVc animated:YES];
}

- (void)clickCancle{
    self.tipcView.hidden = YES;
}

- (void)clickComfirm{
    
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

- (OrderTipcView *)tipcView{
    if (!_tipcView) {
        _tipcView = [OrderTipcView showTipcView];
        _tipcView.delegate = self;
        _tipcView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _tipcView.backgroundColor = [UIColor colorWithWhite:50.0/255.0 alpha:0.4];
        _tipcView.hidden = YES;
    }
    return _tipcView;
}

@end
