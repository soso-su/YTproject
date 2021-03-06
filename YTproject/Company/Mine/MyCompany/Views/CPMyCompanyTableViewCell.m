//
//  CPMyCompanyTableViewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPMyCompanyTableViewCell.h"

@interface CPMyCompanyTableViewCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideImageConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideAngConstraint;

@end

@implementation CPMyCompanyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIsHideImage:(BOOL)isHideImage{
    _isHideImage = isHideImage;
    if (isHideImage) {
        self.logoImageView.hidden = YES;
        self.hideImageConstraint.priority = 1000;
    }else{
        self.logoImageView.hidden = NO;
        self.hideImageConstraint.priority = 250;
    }
}

- (void)setIsHideAngImage:(BOOL)isHideAngImage{
    _isHideAngImage = isHideAngImage;
    if (isHideAngImage) {
        self.angImageView.hidden = YES;
        self.hideAngConstraint.priority = 1000;
    }else{
        self.angImageView.hidden = NO;
        self.hideAngConstraint.priority = 250;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
