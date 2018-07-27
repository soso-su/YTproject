//
//  CPApplicantListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPApplicantListViewController.h"
#import "CPNotEdutionTableViewCell.h"
#import "CPEducationCell.h"
#import "OrderTipcView.h"
#import "CPApplicantDetailViewController.h"

#define cellID @"NotEdutionTableViewCell"
#define edcationCellID @"EducationCell"

@interface CPApplicantListViewController ()<UITableViewDelegate,UITableViewDataSource,CPEducationCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CPApplicantListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CPNotEdutionTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"CPEducationCell" bundle:nil] forCellReuseIdentifier:edcationCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)passInterView{
    [OrderTipcView showWithStr:@"是否将该应聘者状态改为通过面试？" type:TextCenter callBack:^{
        YTLog(@"111111111");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isEducation) {
        CPEducationCell *cell = [tableView dequeueReusableCellWithIdentifier:edcationCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.isHide = NO;
        }else{
            cell.isHide = YES;
        }
        cell.delegate = self;
        return cell;
    }else{
        CPNotEdutionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CPApplicantDetailViewController *vc = [[CPApplicantDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
