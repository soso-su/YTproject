//
//  YTOrderEvaluateListController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/21.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTOrderEvaluateListController.h"
#import "EvaluateCell.h"
#define cellID @"evaluateCell"

@interface YTOrderEvaluateListController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTOrderEvaluateListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"订单评价";
    [self.tableView registerNib:[UINib nibWithNibName:@"EvaluateCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}


@end
