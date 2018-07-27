//
//  YTRecommendViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRecommendViewController.h"
#import "StoreCell.h"
#import "NewProductCell.h"
#import "HotSellCell.h"
#import "TYRotateImageView.h"
#import "YTProductDetailViewController.h"
#import "YTMoreViewController.h"

#define StoreCellID @"Store"
#define StoreHeadID @"StoreHead"
#define NewProductCellID @"NewProduct"
#define NewProductHeadID @"NewProductHead"
#define NewProductFooterID @"NewProductFooter"
#define HotSellCellID @"HotSell"
#define HotHeadID @"HotHead"

static CGFloat StoreHeadHeight = 225;
static CGFloat HotHeadHeight = 210;
static CGFloat NewProductHeadHeight = 90;
static CGFloat margin = 15;


@interface YTRecommendViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,TYRotateImageViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UIView *storeHeadView;

@property (strong, nonatomic) UIView *hotSellHeadView;

@property (strong, nonatomic) UIView *neHeadView;

@property (strong, nonatomic) UIView *neFooterView;

@property (strong, nonatomic) YTTouchView *cellView;

@property (nonatomic, strong)TYRotateImageView *bannerView;

@end

@implementation YTRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    [self.collectionView registerNib:[UINib nibWithNibName:@"StoreCell" bundle:nil] forCellWithReuseIdentifier:StoreCellID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:StoreHeadID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HotSellCell" bundle:nil] forCellWithReuseIdentifier:HotSellCellID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HotHeadID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"NewProductCell" bundle:nil] forCellWithReuseIdentifier:NewProductCellID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NewProductHeadID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NewProductFooterID];
    [self.collectionView setCollectionViewLayout:flayout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return 5;
    }
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        StoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:StoreCellID forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1){
        HotSellCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HotSellCellID forIndexPath:indexPath];
        return cell;
    }else{
        NewProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NewProductCellID forIndexPath:indexPath];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:StoreHeadID forIndexPath:indexPath];
            if (header.subviews.lastObject!=nil) {
                [header.subviews.lastObject removeFromSuperview];
            }
            [header addSubview:self.storeHeadView];
            return header;
        }else if (indexPath.section == 1){
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HotHeadID forIndexPath:indexPath];
            if (header.subviews.lastObject!=nil) {
                [header.subviews.lastObject removeFromSuperview];
            }
            [header addSubview:self.hotSellHeadView];
            return header;
        }else if (indexPath.section == 2){
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HotHeadID forIndexPath:indexPath];
            if (header.subviews.lastObject!=nil) {
                [header.subviews.lastObject removeFromSuperview];
            }
            [header addSubview:self.neHeadView];
            return header;
        }
    }else if (kind == UICollectionElementKindSectionFooter){
        if (indexPath.section == 2) {
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NewProductFooterID forIndexPath:indexPath];
            if (footer.subviews.lastObject!=nil) {
                [footer.subviews.lastObject removeFromSuperview];
            }
            [footer addSubview:self.neFooterView];
            return footer;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return CGSizeMake((kScreen_Width - 50)/5, 146);
    }
    return CGSizeMake((kScreen_Width - 38)/2, 218);
   
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(kScreen_Width, StoreHeadHeight);
    }else if (section == 1){
        return CGSizeMake(kScreen_Width, HotHeadHeight);
    }else if (section == 2){
        return CGSizeMake(kScreen_Width, NewProductHeadHeight);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(kScreen_Width, 50);
    }
    return CGSizeZero;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 1) {
        return 5;
    }
    return 8;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 1) {
        return 5;
    }
    return 8;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(margin, margin, margin, margin);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YTProductDetailViewController *product = [[YTProductDetailViewController alloc]init];
    [self.navigationController pushViewController:product animated:YES];
}

- (void)recommendMore:(UIButton *)btn{
    YTMoreViewController *more = [[YTMoreViewController alloc]init];
    more.title = @"英途推荐";
    [self.navigationController pushViewController:more animated:YES];
}

- (void)hotMore:(UIButton *)btn{
    YTMoreViewController *more = [[YTMoreViewController alloc]init];
    more.title = @"当季热卖";
    [self.navigationController pushViewController:more animated:YES];
}

- (void)newMore:(UIButton *)btn{
    YTMoreViewController *more = [[YTMoreViewController alloc]init];
    more.title = @"新品上架";
    [self.navigationController pushViewController:more animated:YES];
}


- (UIView *)storeHeadView{
    if (!_storeHeadView) {
        CGFloat marginTop = 20;
        UIView *storeHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, StoreHeadHeight)];
        NSArray *imgArr = @[@"homeBanner",@"gsxqPic2",@"shopBanner"];
        TYRotateImageView *bannerView = [[TYRotateImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 187) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
        [storeHeadView addSubview:bannerView];
        
        UIImageView *storeTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconTitle1"]];
        [storeTitleView sizeToFit];
        storeTitleView.frame = CGRectMake(margin, CGRectGetMaxY(bannerView.frame) + marginTop, storeTitleView.width, storeTitleView.height);
        [storeHeadView addSubview:storeTitleView];
        
        UILabel *storeTitleLabel = [[UILabel alloc]init];
        storeTitleLabel.textColor = RGB(51, 51, 51);
        storeTitleLabel.font = [UIFont systemFontOfSize:16.0];
        storeTitleLabel.text = @"英途推荐";
        [storeTitleLabel sizeToFit];
        storeTitleLabel.frame = CGRectMake(CGRectGetMaxX(storeTitleView.frame)+5, CGRectGetMaxY(bannerView.frame) + marginTop, storeTitleLabel.width, storeTitleLabel.height);
        [storeHeadView addSubview:storeTitleLabel];
        _storeHeadView = storeHeadView;
    }
    return _storeHeadView;
}

- (UIView *)hotSellHeadView{
    if (!_hotSellHeadView) {
        CGFloat marginTop = 30;
        UIView *hotSellHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width,HotHeadHeight)];
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        moreBtn.frame = CGRectMake(margin, 0, kScreen_Width - margin*2, 42);
        [moreBtn addTarget:self action:@selector(recommendMore:) forControlEvents:UIControlEventTouchUpInside];
        
        [hotSellHeadView addSubview:moreBtn];
        
        UIImageView *titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconTitle2"]];
        [titleView sizeToFit];
        titleView.frame = CGRectMake(margin, CGRectGetMaxY(moreBtn.frame) + marginTop, titleView.width, titleView.height);
        [hotSellHeadView addSubview:titleView];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = RGB(51, 51, 51);
        titleLabel.font = [UIFont systemFontOfSize:16.0];
        titleLabel.text = @"当季热卖";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(CGRectGetMaxX(titleView.frame)+5, CGRectGetMaxY(moreBtn.frame) + marginTop, titleLabel.width, titleLabel.height);
        [hotSellHeadView addSubview:titleLabel];
        
        YTTouchView *cellView = [[YTTouchView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(titleLabel.frame)+margin, kScreen_Width - margin*2, 105)];
        cellView.backgroundColor = [UIColor whiteColor];
        cellView.layer.cornerRadius = 6.0;
        UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(cellView.width - 95, margin, 95, 60)];
        cellTitle.text = @"超值性价\n初冬新款";
        cellTitle.textColor = RGB(51, 51, 51);
        cellTitle.numberOfLines = 0;
        cellTitle.textAlignment = NSTextAlignmentCenter;
        cellTitle.font = [UIFont systemFontOfSize:17.0];
        [cellView addSubview:cellTitle];
        
        UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellView.width - 95, CGRectGetMaxY(cellTitle.frame), 95, cellView.height - margin*2 - cellTitle.height)];
        priceLabel.text = @"¥26.00";
        priceLabel.font = [UIFont systemFontOfSize:16.0];
        priceLabel.textColor = DefaultColor;
        priceLabel.textAlignment = NSTextAlignmentCenter;
        [cellView addSubview:priceLabel];
        UIImageView *banerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shopPic2"]];
        banerView.frame = CGRectMake(0, 0, cellView.width - 95, cellView.height);
        [cellView addSubview:banerView];
        [hotSellHeadView addSubview:cellView];
        _cellView = cellView;
        _hotSellHeadView = hotSellHeadView;
    }
    return _hotSellHeadView;
}

- (UIView *)neHeadView{
    if (!_neHeadView) {
        CGFloat marginTop = 30;
        UIView *neHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, NewProductHeadHeight)];
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        moreBtn.frame = CGRectMake(margin, 0, kScreen_Width - margin*2, 42);
        [moreBtn addTarget:self action:@selector(hotMore:) forControlEvents:UIControlEventTouchUpInside];
        [neHeadView addSubview:moreBtn];
        
        UIImageView *titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconTitle1"]];
        [titleView sizeToFit];
        titleView.frame = CGRectMake(margin, CGRectGetMaxY(moreBtn.frame) + marginTop, titleView.width, titleView.height);
        [neHeadView addSubview:titleView];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = RGB(51, 51, 51);
        titleLabel.font = [UIFont systemFontOfSize:16.0];
        titleLabel.text = @"新品上架";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(CGRectGetMaxX(titleView.frame)+5, CGRectGetMaxY(moreBtn.frame) + marginTop, titleLabel.width, titleLabel.height);
        [neHeadView addSubview:titleLabel];
        _neHeadView = neHeadView;
    }
    return _neHeadView;
}

- (UIView *)neFooterView{
    if (!_neFooterView) {
        UIView *neFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 50)];
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(newMore:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.frame = CGRectMake(margin, 0, kScreen_Width - margin*2, 42);
        [neFooterView addSubview:moreBtn];
        _neFooterView = neFooterView;
    }
    return _neFooterView;
}

@end
