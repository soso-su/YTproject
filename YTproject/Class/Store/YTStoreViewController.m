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
#import "WJItemsControlView.h"

@interface YTStoreViewController ()<UISearchBarDelegate,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;
@property (strong, nonatomic)WJItemsControlView *itemControlView;
@property (nonatomic ,weak) UIScrollView *scroll;

@end

@implementation YTStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setScrollView];
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

- (void)setScrollView{
    CGFloat itemH = 44;
    NSArray *array = @[@"推荐",@"分类1",@"分类1",@"分类1",@"分类1",@"分类1",@"分类1",@"分类1"];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, itemH, kScreen_Width, kScreen_Height - itemH - self.stateBarAndNavBarHeight)];
    scroll.delegate = self;
    scroll.backgroundColor = [UIColor purpleColor];
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(kScreen_Width*array.count, 100);
    for (int i=0; i<array.count; i++) {
        UICollectionView *collectionView = [self setCollectionView];
        collectionView.tag = i;
        [scroll addSubview:collectionView];
    }
    [self.view addSubview:scroll];
    self.scroll = scroll;
    
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = kScreen_Width/4.0;
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, itemH)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        
        
        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
        
    }];
    [self.view addSubview:_itemControlView];
}

- (UICollectionView *)setCollectionView{
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 40)/2, 218);
    flayout.minimumInteritemSpacing = 8;
    flayout.minimumLineSpacing = 8;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - 45 - self.stateBarAndNavBarHeight) collectionViewLayout:flayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    return collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

//- (__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
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
