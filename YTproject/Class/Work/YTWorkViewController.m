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
#import "WorkHotModel.h"
#import "CarouselModel.h"
#import "PositionModel.h"

#define cellID @"WorkCell"


@interface YTWorkViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,WorkHeadViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) WorkHeadView *headView;
@property (weak, nonatomic) UIButton *addressBtn;
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;

@property (nonatomic, strong) NSMutableArray <WorkHotModel *>*hotArray;
@property (nonatomic, strong) NSMutableArray <CarouselModel *>*imgArray;
@property (nonatomic, strong) NSMutableArray <PositionModel *>*items;

@end

@implementation YTWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavView];
    [self setUpUI];
//    [self getList];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    for (int i = 0;i < 5;i++) {
        WorkHotModel *model = [[WorkHotModel alloc]init];
        [self.hotArray addObject:model];
    }
    if (self.hotArray.count > 5) {
        self.headView.frame = CGRectMake(0, 0, kScreen_Width, 440);
    }else{
        self.headView.frame = CGRectMake(0, 0, kScreen_Width, 320);
    }
    self.headView.imgArray = self.imgArray;
    self.headView.dataSorce = self.hotArray;
    [self.tableView reloadData];
    
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
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
    headView.delegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.items.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    cell.model = self.items[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTWorkDetailViewController *detailVc = [[YTWorkDetailViewController alloc]init];
//    detailVc.positionId = self.items[indexPath.row].positionId;
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)clickCollectViewCellWithIndex:(WorkHotModel *)model{
    YTWorkDetailViewController *detailVc = [[YTWorkDetailViewController alloc]init];
    detailVc.positionId = model.postId;
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

- (NSMutableArray <WorkHotModel *>*)hotArray{
    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

- (NSMutableArray <CarouselModel *>*)imgArray{
    if (!_imgArray) {
        _imgArray = [NSMutableArray array];
    }
    return _imgArray;
}

- (NSMutableArray <PositionModel *>*)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


#pragma mark ------------------HttpRequest----------------
//主页接口
- (void)getList{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTIndexUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        @try {
            [YTProgressHUD dismissHUD];
            YTLog(@"responseObject = %@",responseObject);
            NSArray *hotArr = responseObject[@"bidPositionList"];
            for (NSDictionary *dic in hotArr) {
                WorkHotModel *model = [WorkHotModel yy_modelWithJSON:dic];
                model.postId = [dic[@"id"] integerValue];
                [weakSelf.hotArray addObject:model];
            }
            
            NSArray *imgArr = responseObject[@"shufList"];
            for (NSDictionary *dic in imgArr) {
                CarouselModel *model = [CarouselModel yy_modelWithJSON:dic];
                [weakSelf.imgArray addObject:model];
            }
            NSArray *list = responseObject[@"positionList"];
            NSMutableArray *dataArray = [NSMutableArray array];
            for (NSDictionary *dic in list) {
                PositionModel *model = [PositionModel yy_modelWithJSON:dic];
                model.positionId = [dic[@"id"] integerValue];
                [dataArray addObject:model];
            }
            weakSelf.items = dataArray;
            weakSelf.headView.imgArray = weakSelf.imgArray;
            weakSelf.headView.dataSorce = weakSelf.hotArray;
            [weakSelf viewWillLayoutSubviews];
            [weakSelf.tableView reloadData];
        } @catch (NSException *exception) {
            [YTProgressHUD dismissHUD];
            YTLog(@"YTIndexUrl exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD dismissHUD];
        YTLog(@"YTIndexUrl error = %@",error);
    }];
}


@end
