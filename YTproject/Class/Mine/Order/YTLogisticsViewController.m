//
//  YTLogisticsViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/21.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLogisticsViewController.h"
#import "LogisticsCell.h"
#import "LogistcsHeadView.h"
#import "LogistcModel.h"

#define cellID @"Logistics"

@interface YTLogisticsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)LogistcsHeadView *headView;
@property (nonatomic,strong)NSMutableArray <LogistcModel *>*dataSource;

@end

@implementation YTLogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"物流信息";
    [self.tableView registerNib:[UINib nibWithNibName:@"LogisticsCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.headView;
    
}

- (void)setData{
    LogistcModel *model = [[LogistcModel alloc]init];
    model.date = @"01-24";
    model.time = @"14:41";
    model.title = @"运输中";
    model.msg = @"快件已从 潮汕中心 发出";
    [self.dataSource addObject:model];
    
    LogistcModel *model1 = [[LogistcModel alloc]init];
    model1.date = @"01-23";
    model1.time = @"21:34";
    model1.title = @"";
    model1.msg = @"快件已从 温州中转部 发出";
    [self.dataSource addObject:model1];
    
    LogistcModel *model2 = [[LogistcModel alloc]init];
    model2.date = @"01-23";
    model2.time = @"21:34";
    model2.title = @"";
    model2.msg = @"快件到达 温州中转部";
    [self.dataSource addObject:model2];
    
    LogistcModel *model3 = [[LogistcModel alloc]init];
    model3.date = @"01-23";
    model3.time = @"16:22";
    model3.title = @"";
    model3.msg = @"快件已从 温州藤桥 发出";
    [self.dataSource addObject:model3];
    
    
    LogistcModel *model4 = [[LogistcModel alloc]init];
    model4.date = @"01-23";
    model4.time = @"14:41";
    model4.title = @"已揽件";
    model4.msg = @"温州藤桥 的 夏老头 已揽件";
    [self.dataSource addObject:model4];
    
    LogistcModel *model5 = [[LogistcModel alloc]init];
    model5.date = @"01-23";
    model5.time = @"12:55";
    model5.title = @"已发货";
    model5.msg = @"卖家发货";
    [self.dataSource addObject:model5];
    
    LogistcModel *model6 = [[LogistcModel alloc]init];
    model6.date = @"01-23";
    model6.time = @"12:33";
    model6.title = @"已出库";
    model6.msg = @"您的包裹已出库";
    [self.dataSource addObject:model6];
    
    LogistcModel *model7 = [[LogistcModel alloc]init];
    model7.date = @"01-23";
    model7.time = @"11:21";
    model7.title = @"已下单";
    model7.isHide = YES;
    model7.msg = @"您的订单待配货";
    [self.dataSource addObject:model7];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LogisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (LogistcsHeadView *)headView{
    if (!_headView) {
        _headView = [LogistcsHeadView showHeadView];
        if (kScreen_Width < 414) {
            _headView.frame = CGRectMake(0, 0, kScreen_Width, 180);
        }
    }
    return _headView;
}

- (NSMutableArray <LogistcModel *>*)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
