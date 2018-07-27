//
//  CPWorkViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPWorkViewController.h"
#import "CPWorkCell.h"
#import "OrderTipcView.h"
#import "CPWorkDetailViewController.h"
#import "CPApplicantViewController.h"

#define cellID @"cpWorkCell"
@interface CPWorkViewController ()<UITableViewDelegate,UITableViewDataSource,CPWorkCellDelegate>
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteAllBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation CPWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setUpUI];
}

- (void)setUpUI{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CPWorkCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setNav{
    self.navigationItem.title = @"";
    
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"workIconCard"] forState:UIControlStateNormal];
    [leftBtn setTitle:@" 我的职位" forState:UIControlStateNormal];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    
    UIButton *rigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rigBtn setImage:[UIImage imageNamed:@"workIconPublish"] forState:UIControlStateNormal];
    [rigBtn setTitle:@"发布职位" forState:UIControlStateNormal];
    rigBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    UIButton *rigBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rigBtn1 setImage:[UIImage imageNamed:@"workIconSearch"] forState:UIControlStateNormal];
    [rigBtn1 setTitle:@"搜索人才" forState:UIControlStateNormal];
    rigBtn1.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    UIBarButtonItem *rigBar = [[UIBarButtonItem alloc]initWithCustomView:rigBtn];
    UIBarButtonItem *rigBar1 = [[UIBarButtonItem alloc]initWithCustomView:rigBtn1];
    self.navigationItem.rightBarButtonItems = @[rigBar1,rigBar];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPWorkCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.education = YES;
    }else{
        cell.education = NO;
    }
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CPWorkDetailViewController *detailVc = [[CPWorkDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)clickDeleteBtn{
    [OrderTipcView showWithStr:@"删除该职位？" type:TextCenter callBack:^{
        
    }];
}

- (void)clickApplicantBtn:(BOOL)education{
    CPApplicantViewController *vc = [[CPApplicantViewController alloc]init];
    vc.isEducation = education;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)clickShareBtn{
    
}


- (IBAction)refreshAll:(UIButton *)sender {
    
}
- (IBAction)deleteAll:(UIButton *)sender {
    [OrderTipcView showWithStr:@"删除全部职位？" type:TextCenter callBack:^{
        
    }];
}


@end
