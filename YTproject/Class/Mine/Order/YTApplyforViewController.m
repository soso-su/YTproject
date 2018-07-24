//
//  YTApplyforViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTApplyforViewController.h"
#import "AffirmOrderCell.h"
#import "ApplyforFooterView.h"
#import "YTInputLogistcViewController.h"

#define cellID @"affirmOrderCell"

@interface YTApplyforViewController ()<UITableViewDelegate,UITableViewDataSource,ApplyforFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)ApplyforFooterView *footerView;

@end

@implementation YTApplyforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"申请成功";
    [self.tableView registerNib:[UINib nibWithNibName:@"AffirmOrderCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.footerView.msg = @"退款单号：2346348415238798\n\n创建时间：2017-10-28  12:25\n\n申请退款时间：2017-10-28  12:25";
    
    self.footerView.state = @"退款情况：退款中\n\n请将商品寄回以下地址并填写物流单号：\n\n广东省广州市新港东路1091号四清花艺工作坊\n\n林青玄   13625784457";
    self.footerView.delegate = self;
    self.tableView.tableFooterView = self.footerView;
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AffirmOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)editLogist{
    YTInputLogistcViewController *inputVc = [[YTInputLogistcViewController alloc]init];
    YTWeakSelf
    inputVc.callback = ^(NSString *str) {
        weakSelf.footerView.logist = str;
    };
    [self.navigationController pushViewController:inputVc animated:YES];
}


- (ApplyforFooterView *)footerView{
    if (!_footerView) {
        _footerView = [ApplyforFooterView showApplyforFooterView];
    }
    return _footerView;
}

@end
