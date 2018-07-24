//
//  YTOrderListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTOrderListViewController.h"
#import "YTOrderDetailViewController.h"
#import "YTLogisticsViewController.h"
#import "YTOrderEvaluateListController.h"
#import "OrderListCell.h"
#import "OrderTipcView.h"

#define cellID @"ORDERLIST"

@interface YTOrderListViewController ()<UITableViewDelegate,UITableViewDataSource,OrderListCellDelegate,OrderTipcViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) OrderTipcView *tipcView;

@property (nonatomic, strong) NSMutableArray <OrderListModel *>*dataSorce;

@end

@implementation YTOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [[YTTool getWindow] addSubview:self.tipcView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)setData{
    if (self.type == 0) {
        
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"交易完成";
        list.isHideBottom = YES;
        list.isHideRefund = YES;
        list.orderState = OrderState_DealFinsh;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"交易关闭";
        list1.isHideBottom = YES;
        list1.isHideRefund = YES;
        list1.orderState = OrderState_DealClose;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"交易关闭";
        list2.isHideBottom = YES;
        list2.isHideRefund = NO;
        list2.orderState = OrderState_Refund_Success;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"待收货";
        list3.isHideBottom = NO;
        list3.isHideRefund = YES;
        list3.leftBtnStr = @"查看物流";
        list3.rightBtnStr = @"确认收货";
        list3.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"待发货";
        list4.isHideBottom = YES;
        list4.isHideRefund = YES;
        list4.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list4];
        
        OrderListModel *list5 = [[OrderListModel alloc]init];
        list5.stateStr = @"待付款";
        list5.isHideBottom = NO;
        list5.isHideRefund = YES;
        list5.leftBtnStr = @"取消订单";
        list5.rightBtnStr = @"支付订单";
        list5.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list5];
        
        OrderListModel *list6 = [[OrderListModel alloc]init];
        list6.stateStr = @"待评价";
        list6.isHideBottom = NO;
        list6.isHideRefund = YES;
        list6.isHideLeftBtn = YES;
        list6.rightBtnStr = @"评价";
        list6.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list6];
    }else if (self.type == 1){
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"待付款";
        list.isHideBottom = NO;
        list.isHideRefund = YES;
        list.leftBtnStr = @"取消订单";
        list.rightBtnStr = @"支付订单";
        list.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"待付款";
        list1.isHideBottom = NO;
        list1.isHideRefund = YES;
        list1.leftBtnStr = @"取消订单";
        list1.rightBtnStr = @"支付订单";
        list1.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"待付款";
        list2.isHideBottom = NO;
        list2.isHideRefund = YES;
        list2.leftBtnStr = @"取消订单";
        list2.rightBtnStr = @"支付订单";
        list2.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"待付款";
        list3.isHideBottom = NO;
        list3.isHideRefund = YES;
        list3.leftBtnStr = @"取消订单";
        list3.rightBtnStr = @"支付订单";
        list3.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"待付款";
        list4.isHideBottom = NO;
        list4.isHideRefund = YES;
        list4.leftBtnStr = @"取消订单";
        list4.rightBtnStr = @"支付订单";
        list4.orderState = OrderState_NotPay;
        [self.dataSorce addObject:list4];
    }else if (self.type == 2){
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"待发货";
        list.isHideBottom = YES;
        list.isHideRefund = YES;
        list.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"待发货";
        list1.isHideBottom = YES;
        list1.isHideRefund = YES;
        list1.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"待发货";
        list2.isHideBottom = YES;
        list2.isHideRefund = YES;
        list2.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"待发货";
        list3.isHideBottom = YES;
        list3.isHideRefund = YES;
        list3.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"待发货";
        list4.isHideBottom = YES;
        list4.isHideRefund = YES;
        list4.orderState = OrderState_NotSend;
        [self.dataSorce addObject:list4];
    }else if (self.type == 3){
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"待收货";
        list.isHideBottom = NO;
        list.isHideRefund = YES;
        list.leftBtnStr = @"查看物流";
        list.rightBtnStr = @"确认收货";
        list.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"待收货";
        list1.isHideBottom = NO;
        list1.isHideRefund = YES;
        list1.leftBtnStr = @"查看物流";
        list1.rightBtnStr = @"确认收货";
        list1.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"待收货";
        list2.isHideBottom = NO;
        list2.isHideRefund = YES;
        list2.leftBtnStr = @"查看物流";
        list2.rightBtnStr = @"确认收货";
        list2.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"待收货";
        list3.isHideBottom = NO;
        list3.isHideRefund = YES;
        list3.leftBtnStr = @"查看物流";
        list3.rightBtnStr = @"确认收货";
        list3.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"待收货";
        list4.isHideBottom = NO;
        list4.isHideRefund = YES;
        list4.leftBtnStr = @"查看物流";
        list4.rightBtnStr = @"确认收货";
        list4.orderState = OrderState_NotTake;
        [self.dataSorce addObject:list4];
    }else if (self.type == 4){
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"待评价";
        list.isHideBottom = NO;
        list.isHideRefund = YES;
        list.isHideLeftBtn = YES;
        list.rightBtnStr = @"评价";
        list.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"待评价";
        list1.isHideBottom = NO;
        list1.isHideRefund = YES;
        list1.isHideLeftBtn = YES;
        list1.rightBtnStr = @"评价";
        list1.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"待评价";
        list2.isHideBottom = NO;
        list2.isHideRefund = YES;
        list2.isHideLeftBtn = YES;
        list2.rightBtnStr = @"评价";
        list2.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"待评价";
        list3.isHideBottom = NO;
        list3.isHideRefund = YES;
        list3.isHideLeftBtn = YES;
        list3.rightBtnStr = @"评价";
        list3.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"待评价";
        list4.isHideBottom = NO;
        list4.isHideRefund = YES;
        list4.isHideLeftBtn = YES;
        list4.rightBtnStr = @"评价";
        list4.orderState = OrderState_NotEvaluate;
        [self.dataSorce addObject:list4];
    }else{
        OrderListModel *list = [[OrderListModel alloc]init];
        list.stateStr = @"交易完成";
        list.isHideBottom = YES;
        list.isHideRefund = YES;
        list.orderState = OrderState_DealFinsh;
        [self.dataSorce addObject:list];
        
        OrderListModel *list1 = [[OrderListModel alloc]init];
        list1.stateStr = @"交易关闭";
        list1.isHideBottom = YES;
        list1.isHideRefund = YES;
        list1.orderState = OrderState_DealClose;
        [self.dataSorce addObject:list1];
        
        OrderListModel *list2 = [[OrderListModel alloc]init];
        list2.stateStr = @"交易完成";
        list2.isHideBottom = YES;
        list2.isHideRefund = YES;
        list2.orderState = OrderState_DealFinsh;
        [self.dataSorce addObject:list2];
        
        OrderListModel *list3 = [[OrderListModel alloc]init];
        list3.stateStr = @"交易关闭";
        list3.isHideBottom = YES;
        list3.isHideRefund = YES;
        list3.orderState = OrderState_DealClose;
        [self.dataSorce addObject:list3];
        
        OrderListModel *list4 = [[OrderListModel alloc]init];
        list4.stateStr = @"交易完成";
        list4.isHideBottom = YES;
        list4.isHideRefund = YES;
        list4.orderState = OrderState_DealFinsh;
        [self.dataSorce addObject:list4];
        
        OrderListModel *list5 = [[OrderListModel alloc]init];
        list5.stateStr = @"交易关闭";
        list5.isHideBottom = YES;
        list5.isHideRefund = YES;
        list5.orderState = OrderState_DealClose;
        [self.dataSorce addObject:list5];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSorce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.delegate = self;
    cell.listModel = self.dataSorce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTOrderDetailViewController *detailVc = [[YTOrderDetailViewController alloc]init];
    detailVc.model = self.dataSorce[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)cancleOrder:(OrderListModel *)model{
    if (model.orderState == OrderState_NotPay) {
        self.tipcView.showStr = @"提示：您即将取消该订单";
        self.tipcView.type = TextCenter;
        self.tipcView.hidden = NO;
    }else{
        YTLogisticsViewController *logistVc = [[YTLogisticsViewController alloc]init];
        [self.navigationController pushViewController:logistVc animated:YES];
    }
    
    
}

- (void)comfirmOrder:(OrderListModel *)model{
    if (model.orderState == OrderState_NotTake) {
        self.tipcView.showStr = @"请确认已经收到宝贝，否则可能财物两空！";
        self.tipcView.hidden = NO;
        self.tipcView.type = TextLeft;
    }else if(model.orderState == OrderState_NotEvaluate){
        YTOrderEvaluateListController *evaluateVc = [[YTOrderEvaluateListController alloc]init];
        [self.navigationController pushViewController:evaluateVc animated:YES];
    }
}

- (void)clickComfirm{
    
}

- (void)clickCancle{
    self.tipcView.hidden = YES;
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

- (NSMutableArray <OrderListModel *>*)dataSorce{
    if (!_dataSorce) {
        _dataSorce = [NSMutableArray array];
    }
    return _dataSorce;
}

@end
