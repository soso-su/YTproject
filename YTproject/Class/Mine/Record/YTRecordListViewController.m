//
//  YTRecordListViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRecordListViewController.h"
#import "WorkCell.h"
#import "RecordListModel.h"
#import "YTRecordDetailViewController.h"

#define cellID @"WORKCELL"

@interface YTRecordListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataSore;

@end

@implementation YTRecordListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUpUI];
}

- (void)setData{
    switch (self.vcState) {
        case VcState_All:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_Check;
            list.recordStateStr = @"被查看";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_Interest;
            list1.recordStateStr = @"感兴趣";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_MakeInterview;
            list2.recordStateStr = @"约面试";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_Send;
            list3.recordStateStr = @"已投递";
            [self.dataSore addObject:list3];
        }
            break;
        case VcState_Check:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_Check;
            list.recordStateStr = @"被查看";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_Check;
            list1.recordStateStr = @"被查看";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_Check;
            list2.recordStateStr = @"被查看";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_Check;
            list3.recordStateStr = @"被查看";
            [self.dataSore addObject:list3];
        }
            break;
        case VcState_Interest:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_Interest;
            list.recordStateStr = @"感兴趣";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_Interest;
            list1.recordStateStr = @"感兴趣";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_Interest;
            list2.recordStateStr = @"感兴趣";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_Interest;
            list3.recordStateStr = @"感兴趣";
            [self.dataSore addObject:list3];
        }
            break;
        case VcState_MakeInterview:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_MakeInterview;
            list.recordStateStr = @"约面试";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_MakeInterview;
            list1.recordStateStr = @"约面试";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_MakeInterview;
            list2.recordStateStr = @"约面试";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_MakeInterview;
            list3.recordStateStr = @"约面试";
            [self.dataSore addObject:list3];
        }
            break;
        case VcState_PassInterview:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_PassInterview;
            list.recordStateStr = @"通过面试";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_PassInterview;
            list1.recordStateStr = @"通过面试";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_PassInterview;
            list2.recordStateStr = @"通过面试";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_PassInterview;
            list3.recordStateStr = @"通过面试";
            [self.dataSore addObject:list3];
        }
            break;
            
        default:{
            RecordListModel *list = [[RecordListModel alloc]init];
            list.recordState = RecordState_NoFit;
            list.recordStateStr = @"不合适";
            [self.dataSore addObject:list];
            
            RecordListModel *list1 = [[RecordListModel alloc]init];
            list1.recordState = RecordState_NoFit;
            list1.recordStateStr = @"不合适";
            [self.dataSore addObject:list1];
            
            RecordListModel *list2 = [[RecordListModel alloc]init];
            list2.recordState = RecordState_NoFit;
            list2.recordStateStr = @"不合适";
            [self.dataSore addObject:list2];
            
            RecordListModel *list3 = [[RecordListModel alloc]init];
            list3.recordState = RecordState_NoFit;
            list3.recordStateStr = @"不合适";
            [self.dataSore addObject:list3];
        }
            break;
    }
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"WorkCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSore.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.list = self.dataSore[indexPath.row];
    cell.isCollect = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTRecordDetailViewController *detailVc = [[YTRecordDetailViewController alloc]init];
    detailVc.model = self.dataSore[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (NSMutableArray *)dataSore{
    if (!_dataSore) {
        _dataSore = [NSMutableArray array];
    }
    return _dataSore;
}

@end
