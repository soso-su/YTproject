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
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YTCertificateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellId forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"教师资格证";
        if (self.resumeModel.resume.qualificationImage != nil) {
            cell.iconImageView.image = self.resumeModel.resume.qualificationImage;
        }else{
            [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.resumeModel.resume.qualification] placeholderImage:[UIImage imageNamed:@"jlxqPic2"]];
        }
    }else{
        cell.titleLabel.text = self.resumeModel.resume.certificates_remark;
        if (self.resumeModel.resume.other_certificatesImage != nil) {
            cell.iconImageView.image = self.resumeModel.resume.qualificationImage;
        }else{
            [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.resumeModel.resume.other_certificates] placeholderImage:[UIImage imageNamed:@"jlxqPic2"]];
        }
    }
    
    return cell;
}

#pragma mark =======================UICollectionViewDelegate=========================
@end
