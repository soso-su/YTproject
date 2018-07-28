//
//  CPSettingViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPSettingViewController.h"
#import "CPMyCompanyTableViewCell.h"
#import "YTMessageViewController.h"
#import "YTPwsdViewController.h"
#import "YTLoginViewController.h"
#import "OrderTipcView.h"

#define cellID @"CompanyTableViewCell"

@interface CPSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation CPSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.titleArray = @[@"消息通知",@"修改密码",@"清除缓存",@"检查更新",@"注销"];
    [self setUpUI];
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"CPMyCompanyTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPMyCompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.isHideImage = YES;
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.isHideAngImage = NO;
    }else{
        cell.isHideAngImage = YES;
    }
    cell.leftLabel.text = self.titleArray[indexPath.row];
    if (indexPath.row == 2) {
        cell.rightLabel.text = @"50M";
    }else{
        cell.rightLabel.text = @"";
    }
    if (indexPath.row == self.titleArray.count - 1) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        YTMessageViewController *messageVc = [[YTMessageViewController alloc]init];
        [self.navigationController pushViewController:messageVc animated:YES];
        
    }else if (indexPath.row == 1){
        YTPwsdViewController *pswdVc = [[YTPwsdViewController alloc]init];
        [self.navigationController pushViewController:pswdVc animated:YES];
    }else if (indexPath.row == 4){
        [OrderTipcView showWithStr:@"确定注销？" type:TextCenter callBack:^{
            
            YTLoginViewController *loginVc = [[YTLoginViewController alloc]init];
            [YTTool getWindow].rootViewController = loginVc;
            
        }];
    }
}

@end
