//
//  CPInviteViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPInviteViewController.h"
#import "YTEditResumeTableViewCell.h"
#import "YTDatePickerView.h"

#define cellID @"editResumeTableViewCell"

@interface CPInviteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation CPInviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = @[@"面试时间",@"面试地点",@"面试联系人",@"联系人电话"];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"面试邀约";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YTEditResumeTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 200)];
    UIButton *comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    YTWeakSelf
    [[comfirmBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [comfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [comfirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    comfirmBtn.frame = CGRectMake(15, 51, kScreen_Width - 30, 42);
    [comfirmBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [footerView addSubview:comfirmBtn];
    self.tableView.tableFooterView = footerView;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textField.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            
        }];
    }
}


@end
