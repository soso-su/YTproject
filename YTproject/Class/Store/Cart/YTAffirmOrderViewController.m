//
//  YTAffirmOrderViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAffirmOrderViewController.h"
#import "AffirmOrderCell.h"
#import "AddressHeadView.h"
#import "AffirmOrderFooterView.h"
#import "YTCartAddressViewController.h"
#import "YTPayViewController.h"
#define cellID @"affirmOrderCell"

@interface YTAffirmOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)AddressHeadView *addressView;

@end

@implementation YTAffirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"确认订单";
    [self.tableView registerNib:[UINib nibWithNibName:@"AffirmOrderCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.tableHeaderView = self.addressView;
    self.addressView.selectAddress.touchHandler = ^{
        YTCartAddressViewController *addressVc = [[YTCartAddressViewController alloc]init];
        [self.navigationController pushViewController:addressVc animated:YES];
    };
    self.tableView.tableFooterView = [AffirmOrderFooterView showFooterView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AffirmOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}

- (AddressHeadView *)addressView{
    if (!_addressView) {
        _addressView = [AddressHeadView showHeaderView];
    }
    return _addressView;
}
- (IBAction)commit:(UIButton *)sender {
    YTPayViewController *payVc = [[YTPayViewController alloc]init];
    [self.navigationController pushViewController:payVc animated:YES];
}

@end
