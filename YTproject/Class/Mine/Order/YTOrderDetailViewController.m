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
    self.tableView.tableHeaderView = self.headView;
    self.footerView.showMsg = @"订单号：2346348415238798\n创建时间：2017-10-28   12:25 \n 订单号：2346348415238798 \n 订单号：2346348415238798 \n 订单号：2346348415238798";
    self.tableView.tableFooterView = self.footerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [[YTTool getWindow] addSubview:self.tipcView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AffirmOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.isCart = NO;
    return cell;
}

- (void)giveupOrder{
    self.tipcView.hidden = NO;
    self.tipcView.type = TextCenter;
    self.tipcView.showStr = @"提示：您将取消该订单";
}

- (void)payOrder{
    
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
