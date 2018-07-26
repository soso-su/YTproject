//
//  YTLocalViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLocalViewController.h"
#import "YTLocalListViewController.h"
#import <SGPagingView.h>
#import "YTSearchBar.h"
#import "YTAddressViewController.h"
#import "YTChatViewController.h"
#import "YTLocalSearchViewController.h"

@interface YTLocalViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate,UISearchBarDelegate>
@property (nonatomic ,strong) SGPageTitleView *pageTitleView;
@property (nonatomic ,strong) SGPageContentScrollView *pageContentView;
@property (weak, nonatomic) UIButton *addressBtn;
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;

@end

@implementation YTLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavView];
    [self setPagingView];
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

- (void)setPagingView{
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = DefaultColor;
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width, titleViewH) delegate:self titleNames:@[@"本地活动",@"本地美食",@"本地旅游"] configure:configure];
    self.pageTitleView.selectedIndex = 0;
    [self.view addSubview:self.pageTitleView];
    
    YTLocalListViewController *actVc = [[YTLocalListViewController alloc]init];
    actVc.type = 0;
    
    YTLocalListViewController *cateVc = [[YTLocalListViewController alloc]init];
    cateVc.type = 1;
    
    YTLocalListViewController *travelVc = [[YTLocalListViewController alloc]init];
    travelVc.type = 2;
    
    CGFloat contentViewHeight = self.view.height - titleViewH;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), kScreen_Width, contentViewHeight) parentVC:self childVCs:@[actVc,cateVc,travelVc]];
    self.pageContentView.delegatePageContentScrollView = self;
    [self.view addSubview:self.pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    YTLocalSearchViewController *searchVc = [[YTLocalSearchViewController alloc]init];
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
