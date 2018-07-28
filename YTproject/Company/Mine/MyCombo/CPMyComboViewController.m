//
//  CPMyComboViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPMyComboViewController.h"
#import "MyComTableViewCell.h"
#import "CPOtherComboViewController.h"

#define cellID @"ComTableViewCell"

@interface CPMyComboViewController ()<UITableViewDelegate,UITableViewDataSource,MyComTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CPMyComboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    YTWeakSelf
    self.title = @"我的套餐";
    [self.tableView registerNib:[UINib nibWithNibName:@"MyComTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"购买其他套餐" forState:UIControlStateNormal];
    [btn setTitleColor:DefaultColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setBackgroundImage:[UIImage imageNamed:@"mealBtn2"] forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(footView.width - btn.width - 28, 15, btn.width, btn.height);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        CPOtherComboViewController *vc = [[CPOtherComboViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [footView addSubview:btn];
    self.tableView.tableFooterView = footView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)buyCombo{
    CPOtherComboViewController *vc = [[CPOtherComboViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
