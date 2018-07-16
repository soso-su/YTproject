//
//  YTServerViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTServerViewController.h"
#import "YTSearchBar.h"
#import "YTAddressViewController.h"
#import "YTChatViewController.h"
#import "ServerCollectionViewCell.h"
#import "YTTenementViewController.h"
#import "YTMediumViewController.h"
#define cellID  @"ServerCollectionViewCell"


@interface YTServerViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) UIButton *addressBtn;
@property (weak, nonatomic) YTSearchBar *searchBar;
@property (weak, nonatomic) UIButton *messageBtn;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic ,strong) NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation YTServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setUpUI];
}

- (void)setUpUI{
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 40)/2, 104);
    flayout.minimumInteritemSpacing = 10;
    flayout.minimumLineSpacing = 10;
    [self.collectionView setCollectionViewLayout:flayout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ServerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];
}

- (void)setNav{
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 15, 0, 15);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ServerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.bgImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[indexPath.row]]];
    cell.titleLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YTTenementViewController *tenement = [[YTTenementViewController alloc]init];
    tenement.title = self.titleArray[indexPath.row];
    [self.navigationController pushViewController:tenement animated:YES];
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

- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = @[@"servePic1",@"servePic2",@"servePic1",@"servePic2",@"servePic1",@"servePic2"];
    }
    return _imageArray;
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"中介",@"培训",@"签证保险",@"翻译",@"租房",@"家政"];
    }
    return _titleArray;
}

@end
