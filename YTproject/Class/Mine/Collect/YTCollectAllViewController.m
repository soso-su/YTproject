//
//  YTCollectAllViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCollectAllViewController.h"
#import "CollectCell.h"
#import "YTMediumViewController.h"
#import "YTWorkDetailViewController.h"
#import "YTProductDetailViewController.h"
#import "WorkCell.h"
#import "MoreCell.h"

#define cellID @"collectCell"
#define workCellID @"workCell"
#define moreCellID @"moreCell"
@interface YTCollectAllViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTCollectAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"WorkCell" bundle:nil] forCellReuseIdentifier:workCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"MoreCell" bundle:nil] forCellReuseIdentifier:moreCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.type == 5) {
        WorkCell *cell = [tableView dequeueReusableCellWithIdentifier:workCellID];
        cell.isCollect = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (self.type == 6){
        MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.isCollect = YES;
        return cell;
    }else{
        CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 5) {
        YTWorkDetailViewController *workVc = [[YTWorkDetailViewController alloc]init];
        [self.navigationController pushViewController:workVc animated:YES];
    }else if (self.type == 6){
        YTProductDetailViewController *productVc = [[YTProductDetailViewController alloc]init];
        [self.navigationController pushViewController:productVc animated:YES];
    }else{
        YTMediumViewController *meidumVc = [[YTMediumViewController alloc]init];
        meidumVc.title = [NSString stringWithFormat:@"%@详情",self.title];
        [self.navigationController pushViewController:meidumVc animated:YES];
    }
}


@end
