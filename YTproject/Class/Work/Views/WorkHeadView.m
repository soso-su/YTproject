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

@property (nonatomic, weak)UIView *recommendView;

@property (nonatomic, strong)UIView *carouselView;

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

- (void)setDataSorce:(NSArray<WorkHotModel *> *)dataSorce{
    _dataSorce = dataSorce;
    if (dataSorce.count>5) {
        self.collectionView.size = CGSizeMake(kScreen_Width-30, 210);
    }else{
        self.collectionView.size = CGSizeMake(kScreen_Width-30, 100);
    }
    self.recommendView.frame = CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), kScreen_Width, 48);
    [self.collectionView reloadData];
}

- (void)setImgArray:(NSArray<CarouselModel *> *)imgArray{
    _imgArray = imgArray;
    NSArray *imgArr = @[@"homeBanner",@"gsxqPic2",@"shopBanner"];
    TYRotateImageView *bannerView = [[TYRotateImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 125) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
    [self.carouselView addSubview:bannerView];
    self.bannerView = bannerView;
    [bannerView addPageControlToSuperView:self];
}


- (void)setUpUI{
    
    UIView *carouselView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 125)];
    self.carouselView = carouselView;
    [self addSubview:carouselView];
    
    UIView *hotView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(carouselView.frame), kScreen_Width, 48)];
    
    UIImage *image = [UIImage imageNamed:@"iconTitle1"];
    UIImageView *titleView = [[UIImageView alloc]initWithImage:image];
    titleView.frame = CGRectMake(15.5, 0, image.size.width, image.size.height);
    titleView.centerY = hotView.height/2;
    [hotView addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = RGB(51, 51, 51);
    titleLabel.font = [UIFont systemFontOfSize:15.0];
    titleLabel.text = @"热门职位";
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(CGRectGetMaxX(titleView.frame)+8, 0, titleLabel.width, titleLabel.height);
    titleLabel.centerY = titleView.centerY;
    [hotView addSubview:titleLabel];
    [self addSubview:hotView];
    
    
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(hotView.frame), kScreen_Width-30, 200) collectionViewLayout:flayout];
    collectionView.backgroundColor = RGB(240, 240, 240);
    collectionView.delegate = self;
    collectionView.dataSource = self;

    [collectionView registerNib:[UINib nibWithNibName:@"WorkHeadCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellId];

    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];

    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
    collectionView.alwaysBounceHorizontal = YES;

    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    UIView *recommendView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(collectionView.frame), kScreen_Width, 48)];
    self.recommendView = recommendView;
    
    UIImage *recommendImage = [UIImage imageNamed:@"iconTitle1"];
    UIImageView *recommendTitleView = [[UIImageView alloc]initWithImage:image];
    recommendTitleView.frame = CGRectMake(15.5, 0, recommendImage.size.width, recommendImage.size.height);
    recommendTitleView.centerY = recommendView.height/2;
    [recommendView addSubview:recommendTitleView];
    
    UILabel *recommendTitleLabel = [[UILabel alloc]init];
    recommendTitleLabel.textColor = RGB(51, 51, 51);
    recommendTitleLabel.font = [UIFont systemFontOfSize:15.0];
    recommendTitleLabel.text = @"推荐职位";
    [recommendTitleLabel sizeToFit];
    recommendTitleLabel.frame = CGRectMake(CGRectGetMaxX(recommendTitleView.frame)+8, 0, recommendTitleLabel.width, recommendTitleLabel.height);
    recommendTitleLabel.centerY = recommendTitleView.centerY;
    [recommendView addSubview:recommendTitleLabel];
    [self addSubview:recommendView];
    
}

- (void)bannerImageDidHandleWithIndex:(NSInteger)index{
    YTLog(@"--------->%ld",index);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSorce.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WorkHeadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.model = self.dataSorce[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate) {
        [self.delegate clickCollectViewCellWithIndex:self.dataSorce[indexPath.row]];
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreen_Width-54)/3;
    return CGSizeMake(width, 90);
}



@end
