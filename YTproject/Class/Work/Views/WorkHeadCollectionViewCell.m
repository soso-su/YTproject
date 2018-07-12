//
//  WorkHeadCollectionViewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/5.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "WorkHeadCollectionViewCell.h"

@interface WorkHeadCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *technicalLabel;

@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;

@property (weak, nonatomic) IBOutlet UIImageView *companyLogoImage;

@property (weak, nonatomic) IBOutlet UILabel *companyLabel;


@end

@implementation WorkHeadCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
