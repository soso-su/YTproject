//
//  CPOtherComboViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPOtherComboViewController.h"
#import "OtherComboTableViewCell.h"
#import "CPComfirmComboViewController.h"

#define cellID  @"OtherComboTableViewCell"

@interface CPOtherComboViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selIndex;

@end

@implementation CPOtherComboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"选择套餐";
    YTWeakSelf
    [self.tableView registerNib:[UINib nibWithNibName:@"OtherComboTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(62, 50, kScreen_Width - 124, 36);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        CPComfirmComboViewController *vc = [[CPComfirmComboViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [footView addSubview:btn];
    self.tableView.tableFooterView = footView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OtherComboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (_selIndex == indexPath) {
        cell.selectBtn.selected = YES;
    }else{
        cell.selectBtn.selected = NO;
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selIndex = indexPath;
    [tableView reloadData];
}


@end
