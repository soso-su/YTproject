//
//  YTRecordDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRecordDetailViewController.h"
#import "RecordDetailCell.h"
#import "RecordHeadView.h"
#import "RecordFooterView.h"
#import "RecordMsgModel.h"
#import "YTWorkDetailViewController.h"

#define cellID @"recordDetailCell"

@interface YTRecordDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSorce;

@property (nonatomic, strong) RecordHeadView *headView;


@end

@implementation YTRecordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"投递记录";
    [self.tableView registerNib:[UINib nibWithNibName:@"RecordDetailCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    RecordHeadView *headView = self.headView;
    headView.model = self.model;
    headView.callback = ^(RecordListModel *model) {
        YTWorkDetailViewController *detailVc = [[YTWorkDetailViewController alloc]init];
        [self.navigationController pushViewController:detailVc animated:YES];
    };
    self.tableView.tableHeaderView = headView;
    
    RecordFooterView *footerView = [RecordFooterView showRecordFooterView];
    footerView.frame = CGRectMake(0, 0, footerView.width, 5);
    self.tableView.tableFooterView = footerView;
}

- (void)setData{
    if (self.model.recordState == RecordState_Check) {
        
        RecordMsgModel *model = [[RecordMsgModel alloc]init];
        model.title = @"HR已经查看了您的简历";
        model.time = @"今天 12:28";
        model.isRed = YES;
        [self.dataSorce addObject:model];
        
        RecordMsgModel *model2 = [[RecordMsgModel alloc]init];
        model2.title = @"简历投递成功";
        model2.time = @"2018-04-11 12:28";
        model2.isRed = NO;
        model2.hideLine = YES;
        [self.dataSorce addObject:model2];
        
    }else if (self.model.recordState == RecordState_Interest){
        
        RecordMsgModel *model = [[RecordMsgModel alloc]init];
        model.title = @"HR将您的简历标记为感兴趣";
        model.time = @"今天 12:28";
        model.isRed = YES;
        [self.dataSorce addObject:model];
        
        RecordMsgModel *model1 = [[RecordMsgModel alloc]init];
        model1.title = @"HR已经查看了您的简历";
        model1.time = @"今天 12:28";
        model1.isRed = NO;
        [self.dataSorce addObject:model1];
        
        RecordMsgModel *model2 = [[RecordMsgModel alloc]init];
        model2.title = @"简历投递成功";
        model2.time = @"今天 12:28";
        model2.isRed = NO;
        model2.hideLine = YES;
        [self.dataSorce addObject:model2];
        
    }else if (self.model.recordState == RecordState_MakeInterview){
        
        RecordMsgModel *model = [[RecordMsgModel alloc]init];
        model.title = @"发出了面试邀请，看具体信息如下";
        model.time = @"今天 12:28";
        model.isRed = YES;
        model.isShowLetter = YES;
        [self.dataSorce addObject:model];
        
        RecordMsgModel *inModel = [[RecordMsgModel alloc]init];
        inModel.title = @"HR将您的简历标记为感兴趣";
        inModel.time = @"今天 12:28";
        inModel.isRed = NO;
        [self.dataSorce addObject:inModel];
        
        RecordMsgModel *model1 = [[RecordMsgModel alloc]init];
        model1.title = @"HR已经查看了您的简历";
        model1.time = @"今天 12:28";
        model1.isRed = NO;
        [self.dataSorce addObject:model1];
        
        RecordMsgModel *model2 = [[RecordMsgModel alloc]init];
        model2.title = @"简历投递成功";
        model2.time = @"今天 12:28";
        model2.isRed = NO;
        model2.hideLine = YES;
        [self.dataSorce addObject:model2];
        
    }else if (self.model.recordState == RecordState_PassInterview){
        RecordMsgModel *model = [[RecordMsgModel alloc]init];
        model.title = @"HR将您的简历标记为感兴趣";
        model.time = @"今天 12:28";
        model.isRed = YES;
        [self.dataSorce addObject:model];
        
        RecordMsgModel *model1 = [[RecordMsgModel alloc]init];
        model1.title = @"HR已经查看了您的简历";
        model1.time = @"今天 12:28";
        model1.isRed = NO;
        [self.dataSorce addObject:model1];
        
        RecordMsgModel *model2 = [[RecordMsgModel alloc]init];
        model2.title = @"简历投递成功";
        model2.time = @"今天 12:28";
        model2.isRed = NO;
        model2.hideLine = YES;
        [self.dataSorce addObject:model2];
    }else{
        RecordMsgModel *model1 = [[RecordMsgModel alloc]init];
        model1.title = @"HR已经查看了您的简历";
        model1.time = @"今天 12:28";
        model1.isRed = YES;
        [self.dataSorce addObject:model1];
        
        RecordMsgModel *model2 = [[RecordMsgModel alloc]init];
        model2.title = @"简历投递成功";
        model2.time = @"今天 12:28";
        model2.isRed = NO;
        model2.hideLine = YES;
        [self.dataSorce addObject:model2];
    }
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSorce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecordDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = self.dataSorce[indexPath.row];
    return cell;
}


- (NSMutableArray *)dataSorce{
    if (!_dataSorce) {
        _dataSorce = [NSMutableArray array];
    }
    return _dataSorce;
}

- (RecordHeadView *)headView{
    if (!_headView) {
        _headView = [RecordHeadView showRecordHeadView];
        if (kScreen_Width < 414) {
            _headView.frame = CGRectMake(0, 0, kScreen_Width, 180);
        }
    }
    return _headView;
}

@end
