//
//  YTCartViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCartViewController.h"
#import "YTAffirmOrderViewController.h"
#import "CartCell.h"
#define cellID @"cartCell"

@interface YTCartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectAllBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *countView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) BOOL isSelectAll;

@end

@implementation YTCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setNav];
    [self setUI];
}

- (void)setUI{
    self.title = @"购物车";
    [self.tableView registerNib:[UINib nibWithNibName:@"CartCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.deleteBtn.hidden = YES;
    
}

- (void)setNav{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    [rightBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, rightBtn.width, rightBtn.height);
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightBtn = rightBtn;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setData{
    [self.dataSource addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (self.isSelectAll) {
        cell.selectBtn.selected = YES;
    }else{
        cell.selectBtn.selected = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)edit:(UIButton *)btn{
    if ([btn.currentTitle isEqualToString:@"编辑"]) {
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        self.commitBtn.hidden = YES;
        self.countView.hidden = YES;
        self.deleteBtn.hidden = NO;
    }else{
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
        self.commitBtn.hidden = NO;
        self.countView.hidden = NO;
        self.deleteBtn.hidden = YES;
    }
}

- (IBAction)commit:(UIButton *)sender {
    YTAffirmOrderViewController *affirmVc = [[YTAffirmOrderViewController alloc]init];
    [self.navigationController pushViewController:affirmVc animated:YES];
}
- (IBAction)selectAll:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.isSelectAll = sender.selected;
    [self.tableView reloadData];
}
- (IBAction)deleteOrder:(UIButton *)sender {
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

@end
