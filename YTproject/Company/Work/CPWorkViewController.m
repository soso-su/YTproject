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

#define cellID @"cpWorkCell"
@interface CPWorkViewController ()<UITableViewDelegate,UITableViewDataSource,CPWorkCellDelegate,OrderTipcViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteAllBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) OrderTipcView *tipView;


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
    [[YTTool getWindow] addSubview:self.tipView];
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
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CPWorkDetailViewController *detailVc = [[CPWorkDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)clickDeleteBtn{
    self.tipView.showStr = @"删除该职位？";
    self.tipView.type = TextCenter;
    self.tipView.hidden = NO;
}

- (void)clickShareBtn{
    
}

- (void)clickComfirm{
    self.tipView.hidden = YES;
}

- (void)clickCancle{
    self.tipView.hidden = YES;
}

- (IBAction)refreshAll:(UIButton *)sender {
    
}
- (IBAction)deleteAll:(UIButton *)sender {
    self.tipView.showStr = @"删除全部职位？";
    self.tipView.type = TextCenter;
    self.tipView.hidden = NO;
}


- (OrderTipcView *)tipView{
    if (!_tipView) {
        _tipView = [OrderTipcView showTipcView];
        _tipView.delegate = self;
        _tipView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _tipView.backgroundColor = [UIColor colorWithWhite:50.0/255.0 alpha:0.4];
        _tipView.hidden = YES;
    }
    return _tipView;
}

@end
