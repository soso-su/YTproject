//
//  YTWorkViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkViewController.h"
#import "WorkTableViewCell.h"
#import "WorkHeadView.h"
#import "YTSearchBar.h"
#import "YTAddressViewController.h"
#import "YTWorkSearchViewController.h"
#import "YTWorkDetailViewController.h"
#import "RongIMKit/RongIMKit.h"
#import "YTChatViewController.h"

#define cellID @"WorkCell"

@interface YTWorkViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,WorkHeadViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) WorkHeadView *headView;
@property (weak, nonatomic) UIButton *addressBtn;
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;

@end

@implementation YTWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavView];
    [self setUpUI];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.headView.frame = CGRectMake(0, 0, kScreen_Width, 412);
}

- (void)setNavView{
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addressBtn setTitle:@"广州" forState:UIControlStateNormal];
    [addressBtn setImage:[UIImage imageNamed:@"homeLocation"] forState:UIControlStateNormal];
    addressBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 52, 0, 0);
    addressBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    addressBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [addressBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addressBtn = addressBtn;
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:addressBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
    [addressBtn addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIView *tiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - addressBtn.width - 110, 30)];
    YTSearchBar *searchBar = [[YTSearchBar alloc]initWithFrame:CGRectMake(20, 0, tiView.width - 20, 30)];
    searchBar.layer.cornerRadius = 4.0;
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入关键字搜索";
    
    self.searchBar = searchBar;
    [tiView addSubview:searchBar];
    self.navigationItem.titleView = tiView;
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setImage:[UIImage imageNamed:@"homeIconChat"] forState:UIControlStateNormal];
    self.messageBtn = messageBtn;
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:messageBtn];
    self.navigationItem.rightBarButtonItem = rightBar;
    [messageBtn addTarget:self action:@selector(chat) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"WorkTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    WorkHeadView *headView = [[WorkHeadView alloc]init];
    self.tableView.tableHeaderView = headView;
    headView.delegate = self;
    self.headView = headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTWorkDetailViewController *detailVc = [[YTWorkDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)clickCollectViewCellWithIndex:(NSInteger)index{
    YTWorkDetailViewController *detailVc = [[YTWorkDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    YTWorkSearchViewController *searchVc = [[YTWorkSearchViewController alloc]init];
    [self.navigationController pushViewController:searchVc animated:YES];
}

- (void)selectAddress:(UIButton *)sender{
    YTAddressViewController *addressVc = [[YTAddressViewController alloc]init];
    [self.navigationController pushViewController:addressVc animated:YES];
}

- (void)chat{
    YTChatViewController *chat = [[YTChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
                                                                                               targetId:@"yt1"];
    chat.title = @"英途客服";
    chat.conversationType = ConversationType_PRIVATE;
    chat.targetId = @"yt1";
    [self.navigationController pushViewController:chat animated:YES];
}


@end
