//
//  YTCollectViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCollectViewController.h"
#import "YTPageViewController.h"
#import "YTCollectAllViewController.h"
#import "YTSearchBar.h"


@interface YTCollectViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) YTSearchBar *searchBar;
@end

@implementation YTCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    if (!self.isSearch) {
        self.title = @"我的收藏";
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"workIconSearch"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }else{
        UIView *tiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width -110, 30)];
        YTSearchBar *searchBar = [[YTSearchBar alloc]initWithFrame:CGRectMake(20, 0, tiView.width - 20, 30)];
        searchBar.layer.cornerRadius = 4.0;
        searchBar.delegate = self;
        searchBar.placeholder = @"请输入关键字搜索";
        
        self.searchBar = searchBar;
        [tiView addSubview:searchBar];
        self.navigationItem.titleView = tiView;
        
    }
    
    YTCollectAllViewController *allVc = [[YTCollectAllViewController alloc]init];
    allVc.type = 0;
    allVc.title = @"全部";
    
    YTCollectAllViewController *serverVc = [[YTCollectAllViewController alloc]init];
    serverVc.type = 1;
    serverVc.title = @"服务";
    
    YTCollectAllViewController *activeVc = [[YTCollectAllViewController alloc]init];
    activeVc.type = 2;
    activeVc.title = @"活动";
    
    YTCollectAllViewController *foodVc = [[YTCollectAllViewController alloc]init];
    foodVc.type = 3;
    foodVc.title = @"美食";
    
    YTCollectAllViewController *trolVc = [[YTCollectAllViewController alloc]init];
    trolVc.type = 4;
    trolVc.title = @"旅游";
    
    YTCollectAllViewController *workVc = [[YTCollectAllViewController alloc]init];
    workVc.type = 5;
    workVc.title = @"职位";
    
    YTCollectAllViewController *goodsVc = [[YTCollectAllViewController alloc]init];
    goodsVc.type = 6;
    goodsVc.title = @"商品";
    
    YTPageViewController *pageView = [YTPageViewController pageWithViewControllers:@[allVc,serverVc,activeVc,foodVc,trolVc,workVc,goodsVc] configuration:[YTPageViewControllerConfiguration defaultConfiguration]];
    pageView.view.frame = self.view.frame;
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}

- (void)search{
    YTCollectViewController *collect = [[YTCollectViewController alloc]init];
    collect.isSearch = YES;
    [self.navigationController pushViewController:collect animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    
}

@end
