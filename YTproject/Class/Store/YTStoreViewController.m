//
//  YTStoreViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTStoreViewController.h"
#import "YTChatViewController.h"
#import "YTSearchBar.h"
#import "YTRecommendViewController.h"
#import "YTGeneralViewController.h"
#import "YTPageViewController.h"

@interface YTStoreViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;
@property (nonatomic ,strong) YTPageViewController *pageView;

@end

@implementation YTStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setUpUI];
}

- (void)setUpUI{
    YTPageViewControllerConfiguration *config = [YTPageViewControllerConfiguration defaultConfiguration];
    YTRecommendViewController *recommendVc = [[YTRecommendViewController alloc]init];
    recommendVc.title = @"推荐";
    
    YTGeneralViewController *geneVc = [[YTGeneralViewController alloc]init];
    geneVc.title = @"分类";
    
    YTGeneralViewController *geneVc1 = [[YTGeneralViewController alloc]init];
    geneVc1.title = @"分类1";
    
    YTGeneralViewController *geneVc2 = [[YTGeneralViewController alloc]init];
    geneVc2.title = @"分类2";
    
    YTGeneralViewController *geneVc3 = [[YTGeneralViewController alloc]init];
    geneVc3.title = @"分类3";
    
    YTGeneralViewController *geneVc4 = [[YTGeneralViewController alloc]init];
    geneVc4.title = @"分类4";
    
    YTGeneralViewController *geneVc5 = [[YTGeneralViewController alloc]init];
    geneVc5.title = @"分类5";
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[recommendVc,geneVc,geneVc1,geneVc2,geneVc3,geneVc4,geneVc5] configuration:config];
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}


- (void)setNav{

    self.navigationItem.leftBarButtonItem = nil;
    UIView *tiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - 90, 30)];
    YTSearchBar *searchBar = [[YTSearchBar alloc]initWithFrame:CGRectMake(0, 0, tiView.width, 30)];
    searchBar.layer.cornerRadius = 6.0;
    searchBar.layer.masksToBounds = YES;
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




- (void)chat{

    YTChatViewController *chat = [[YTChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
                                                                               targetId:@"yt1"];
    chat.title = @"英途客服";
    chat.conversationType = ConversationType_PRIVATE;
    chat.targetId = @"yt1";
    [self.navigationController pushViewController:chat animated:YES];
}




@end
