//
//  BuyView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "BuyView.h"

@interface BuyView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BuyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setUpUI{
    CGFloat margin = 15;
    CGFloat bgH = 270;
    CGFloat collectH = 55;
    if (self.dataSorce.count > 4&&self.dataSorce.count <=8) {
        bgH = 305;
        collectH = 90;
    }else if (self.dataSorce.count > 8){
        bgH = 340;
        collectH = 125;
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(margin, self.height - bgH -5, kScreen_Width - margin * 2, bgH)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 6.0;
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setImage:[UIImage imageNamed:@"productIconClose"] forState:UIControlStateNormal];
    [deleteBtn sizeToFit];
    deleteBtn.frame = CGRectMake(bgView.width - deleteBtn.width - margin, margin, deleteBtn.width, deleteBtn.height);
    [bgView addSubview:deleteBtn];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"立即购买";
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    titleLabel.textColor = RGB(51, 51, 51);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(margin, 0, bgView.width - margin*3 - deleteBtn.width , titleLabel.height);
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((bgView.width - 75)/4, 25);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+margin, bgView.width, collectH) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [bgView addSubview:collectionView];
    [self addSubview:bgView];
    
    
}


@end
