//
//  YTMineViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTMineViewController.h"
#import "YTPeronalInformationViewController.h"
#import "YTResumeViewController.h"
#import "TestViewController.h"
#import "YTOrderViewController.h"

@interface YTMineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)NSArray *itemTitleArr;
@property (nonatomic,copy)NSArray *itemImageArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //设置透明导航栏
    self.title = @"个人资料";
    self.navigationItem.title = nil;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:DefaultColor] forBarMetrics:UIBarMetricsDefault];
    
}

#pragma mark =======================ActionEvent=========================
- (IBAction)peronalInformation:(UIButton *)sender {
    YTPeronalInformationViewController *personalVc = [[YTPeronalInformationViewController alloc]init];
    [self.navigationController pushViewController:personalVc animated:YES];
}

- (IBAction)personalResume:(UIButton *)sender {
    
//    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, tableView.width, tableView.rowHeight)];
    
    cell.textLabel.text = self.itemTitleArr[indexPath.row];
    cell.imageView.image = self.itemImageArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"porfileIconMore"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark =======================UITableViewDelegate=========================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        YTOrderViewController *orderVc = [[YTOrderViewController alloc]init];
        [self.navigationController pushViewController:orderVc animated:YES];
    }
}
#pragma mark =======================Setup=========================


#pragma mark =======================Lazy=========================
-(NSArray *)itemTitleArr
{
    if (!_itemTitleArr) {
        _itemTitleArr = @[@"我的订单",@"我的收藏",@"我的积分",@"设置",@"关于我们",@"意见反馈"];
    }
    
    return _itemTitleArr;
}

-(NSArray *)itemImageArr
{
    
    if (!_itemImageArr) {
        _itemImageArr = @[[UIImage imageNamed:@"porfileIconIndent"],
                          [UIImage imageNamed:@"porfileIconCollect"],
                          [UIImage imageNamed:@"porfileIconIntegral"],
                          [UIImage imageNamed:@"porfileIconSet"],
                          [UIImage imageNamed:@"porfileIconAbout"],
                          [UIImage imageNamed:@"porfileIconFeedback"]];
    }
    
    return _itemImageArr;
}

@end
