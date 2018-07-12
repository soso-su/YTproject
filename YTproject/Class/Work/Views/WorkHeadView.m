//
//  WorkHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "WorkHeadView.h"
#import "TYRotateImageView.h"
#import "WorkHeadCollectionViewCell.h"
#define cellId @"HeadCollectionViewCell"
#define headID @"head"
#define footerID @"footer"

@interface WorkHeadView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TYRotateImageViewDelegate>

@property (nonatomic, weak)TYRotateImageView *bannerView;

@property (nonatomic, weak)UICollectionView *collectionView;

@end

@implementation WorkHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    NSArray *imgArr = @[@"homeBanner",@"gsxqPic2",@"shopBanner"];
    TYRotateImageView *bannerView = [[TYRotateImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 125) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
    [self addSubview:bannerView];
    self.bannerView = bannerView;
    [bannerView addPageControlToSuperView:self];
    
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 50)/3, 92);
    flayout.minimumInteritemSpacing = 8;
    flayout.minimumLineSpacing = 8;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(bannerView.frame), kScreen_Width-30, 288) collectionViewLayout:flayout];
    collectionView.backgroundColor = RGB(238, 238, 238);
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.scrollEnabled = NO;
    [collectionView registerNib:[UINib nibWithNibName:@"WorkHeadCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellId];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
    collectionView.autoresizingMask = NO;
    
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
}

- (void)bannerImageDidHandleWithIndex:(NSInteger)index{
    YTLog(@"--------->%ld",index);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WorkHeadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate) {
        [self.delegate clickCollectViewCellWithIndex:indexPath.row];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headID forIndexPath:indexPath];
        if (header.subviews.lastObject!=nil) {
            [header.subviews.lastObject removeFromSuperview];
        }
        
        UIImage *image = [UIImage imageNamed:@"iconTitle1"];
        UIImageView *titleView = [[UIImageView alloc]initWithImage:image];
        titleView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [header addSubview:titleView];
        titleView.centerY = header.height/2;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = RGB(51, 51, 51);
        titleLabel.font = [UIFont systemFontOfSize:15.0];
        titleLabel.text = @"热门职位";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(10, 0, titleLabel.width, titleLabel.height);
        titleLabel.centerY = titleView.centerY;
        [header addSubview:titleLabel];
        return header;
    }else if (kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
        if (footer.subviews.lastObject!=nil) {
            [footer.subviews.lastObject removeFromSuperview];
        }
        UIImage *image = [UIImage imageNamed:@"iconTitle1"];
        UIImageView *titleView = [[UIImageView alloc]initWithImage:image];
        titleView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [footer addSubview:titleView];
        titleView.centerY = footer.height/2;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = RGB(51, 51, 51);
        titleLabel.font = [UIFont systemFontOfSize:15.0];
        titleLabel.text = @"推荐职位";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(10, 0, titleLabel.width, titleLabel.height);
        titleLabel.centerY = titleView.centerY;
        [footer addSubview:titleLabel];
        
        return footer;
    }else{
        return nil;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreen_Width - 30, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(kScreen_Width - 30, 50);
}


@end
