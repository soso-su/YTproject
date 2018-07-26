//
//  YTIntegralViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTIntegralViewController.h"
#import "IntergralCell.h"
#import "IntergralHeadView.h"
#import "YTDatePickerView.h"
#define cellID @"intergral"

@interface YTIntegralViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) IntergralHeadView *headView;

@end

@implementation YTIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"我的积分";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"integrateNavIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(selectDate)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IntergralCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IntergralCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)selectDate{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    [fmt setDateFormat:@"yyyy-MM-dd"];
    NSDate *defaultDate = [fmt dateFromString:@"1994-02-20"];
    [YTDatePickerView showWithDefaultSelectDate:defaultDate SelectBlock:^(NSDate* date) {
        
        NSString *newDateStr = [fmt stringFromDate:date];
        YTLog(@"newDateStr = %@",newDateStr);
    }];
}

- (IntergralHeadView *)headView{
    if (!_headView) {
        _headView = [IntergralHeadView showIntergralHeadView];
    }
    return _headView;
}

@end
