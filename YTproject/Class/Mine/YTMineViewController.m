//
//  YTMineViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTMineViewController.h"

@interface YTMineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)NSArray *itemTitleArr;
@property (nonatomic,copy)NSArray *itemImageArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark =======================UITableViewDelegate=========================

#pragma mark =======================Setup=========================
- (void)setupNav{
    
    //设置透明导航栏
    self.navigationItem.title = nil;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}

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
