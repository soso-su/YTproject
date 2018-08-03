//
//  YTAddressViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAddressViewController.h"
#import "WorkAddressCollectionViewCell.h"
#import "WorkAddressHeadView.h"
#define cellID @"addressCollectionViewCell"
#define HeadID @"addressCollectionViewHead"
#define FooterID @"addressCollectionViewFooter"


@interface YTAddressViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) WorkAddressHeadView *headView;


@end

@implementation YTAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"选择城市";
    self.view.backgroundColor = RGB(242, 242, 242);
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 90)/3, 35);
    flayout.minimumInteritemSpacing = 20;
    flayout.minimumLineSpacing = 15;
    [self.collectionView setCollectionViewLayout:flayout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WorkAddressCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = RGB(242, 242, 242);
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.autoresizingMask = NO;
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeadID];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 25, 10, 25);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WorkAddressCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeadID forIndexPath:indexPath];
        if (header.subviews.lastObject!=nil) {
            [header.subviews.lastObject removeFromSuperview];
        }
        if (indexPath.section == 0) {
            [header addSubview:self.headView];
        }else{
            UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kScreen_Width - 30, 30)];
            headLabel.font = [UIFont systemFontOfSize:14.0];
            headLabel.textColor = RGB(51, 51, 51);
            headLabel.text = @"G";
            [header addSubview:headLabel];
        }
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(kScreen_Width, 122);
    }else
        return CGSizeMake(kScreen_Width, 40);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YTLog(@"%zd",indexPath.row);
}

- (WorkAddressHeadView *)headView{
    if (!_headView) {
        _headView = [WorkAddressHeadView headView];
        _headView.frame = CGRectMake(0, 0, kScreen_Width, 122);
    }
    return _headView;
}


@end
