//
//  CPMineViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPMineViewController.h"
#import "CPMyCompanyViewController.h"
#import "CPMyCompanyTableViewCell.h"
#import "CPMyComboViewController.h"
#import "CPSettingViewController.h"
#import "YTAboutMineViewController.h"
#import "CPAttestationViewController.h"
#import "CPYingTuAttestationViewController.h"

#define cellID @"companyTableViewCell"

@interface CPMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSArray *itemTitleArr;
@property (nonatomic,copy)NSArray *itemImageArr;

@end

@implementation CPMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CPMyCompanyTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPMyCompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.isHideImage = NO;
    cell.logoImageView.image = self.itemImageArr[indexPath.row];
    cell.leftLabel.text = self.itemTitleArr[indexPath.row];
    cell.rightLabel.hidden = YES;
    if (indexPath.row == self.itemImageArr.count - 1) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CPMyCompanyViewController *vc = [[CPMyCompanyViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        CPMyComboViewController *vc = [[CPMyComboViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        CPSettingViewController *vc = [[CPSettingViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        YTAboutMineViewController *aboutVc = [[YTAboutMineViewController alloc]init];
        [self.navigationController pushViewController:aboutVc animated:YES];
    }
}


- (IBAction)attestation:(UIButton *)sender {
    CPAttestationViewController *vc = [[CPAttestationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)addAttestation:(UIButton *)sender {
    CPYingTuAttestationViewController *vc = [[CPYingTuAttestationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSArray *)itemTitleArr
{
    if (!_itemTitleArr) {
        _itemTitleArr = @[@"我的公司",@"我的套餐",@"设置",@"关于我们"];
    }
    
    return _itemTitleArr;
}

-(NSArray *)itemImageArr
{
    
    if (!_itemImageArr) {
        _itemImageArr = @[[UIImage imageNamed:@"wdIconCompany"],
                          [UIImage imageNamed:@"wdIconMeal"],
                          [UIImage imageNamed:@"wdIconSet"],
                          [UIImage imageNamed:@"wdIconAbout"],
                          ];
    }
    
    return _itemImageArr;
}



@end
