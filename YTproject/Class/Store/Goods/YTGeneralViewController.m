//
//  YTGeneralViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTGeneralViewController.h"
#import "StoreCell.h"
#define cellID  @"storeCell"

@interface YTGeneralViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation YTGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 38)/2, 232);
    flayout.minimumInteritemSpacing = 8;
    flayout.minimumLineSpacing = 8;
    [self.collectionView setCollectionViewLayout:flayout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"StoreCell" bundle:nil] forCellWithReuseIdentifier:cellID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}


@end
