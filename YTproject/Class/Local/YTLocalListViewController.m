//
//  YTLocalListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/13.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLocalListViewController.h"
#import "YTActiveDetailsViewController.h"
#import "YTCateDetailsViewController.h"
#import "LocalListCell.h"
#import "CustomButton.h"
#define cellID @"ListCell"

@interface YTLocalListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTLocalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    
    CGFloat margin = 20;
    [self.tableView registerNib:[UINib nibWithNibName:@"LocalListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    CustomButton *newBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    
    [newBtn setTitle:@"最新" forState:UIControlStateNormal];
    [newBtn setImage:[UIImage imageNamed:@"localIconArrows"] forState:UIControlStateNormal];
    [newBtn sizeToFit];
    newBtn.frame = CGRectMake(headView.width - margin - newBtn.width, 0, newBtn.width+15, newBtn.height);
    [headView addSubview:newBtn];
    newBtn.centerY = headView.height/2;
    newBtn.customButtonType = LabelLeftImageRight;
    
    CustomButton *hotBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    
    [hotBtn setTitle:@"热度" forState:UIControlStateNormal];
    [hotBtn setImage:[UIImage imageNamed:@"localIconArrowsPre"] forState:UIControlStateNormal];
    [hotBtn setTitleColor:DefaultColor forState:UIControlStateNormal];
    [hotBtn sizeToFit];
    hotBtn.frame = CGRectMake(headView.width - margin - hotBtn.width - newBtn.width - 10, 0, hotBtn.width+15, hotBtn.height);
    [headView addSubview:hotBtn];
    hotBtn.centerY = headView.height/2;
    hotBtn.customButtonType = LabelLeftImageRight;
    
    self.tableView.tableHeaderView = headView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocalListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.titleView.hidden = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *control = [[UIViewController alloc]init];
    if (self.type == 0) {
        YTActiveDetailsViewController *active = [[YTActiveDetailsViewController alloc]init];
        active.title = @"活动详情";
        control = active;
    }else if (self.type == 1){
        YTCateDetailsViewController *cate = [[YTCateDetailsViewController alloc]init];
        control = cate;
    }else{
        YTActiveDetailsViewController *travel = [[YTActiveDetailsViewController alloc]init];
        travel.title = @"旅游详情";
        control = travel;
    }
    
    [self.navigationController pushViewController:control animated:YES];
}

@end
