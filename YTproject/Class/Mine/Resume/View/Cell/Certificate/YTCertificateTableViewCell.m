//
//  CertificateTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCertificateTableViewCell.h"
#import "YTCertificateCollectionViewCell.h"

@interface YTCertificateTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation YTCertificateTableViewCell

static NSString *const CollectionViewCellId = @"CollectionViewId";

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YTCertificateCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:CollectionViewCellId];
}

#pragma mark =======================UICollectionViewDataSource=========================
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YTCertificateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellId forIndexPath:indexPath];
    cell.titleLabel.text = @"四级证书";
    
    return cell;
}

#pragma mark =======================UICollectionViewDelegate=========================
@end