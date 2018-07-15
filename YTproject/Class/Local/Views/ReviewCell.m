//
//  ReviewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/15.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ReviewCell.h"

@interface ReviewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userLogoImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation ReviewCell

- (void)setModel:(ReviewModel *)model{
    _model = model;
    self.userLogoImage.image = [UIImage imageNamed:model.imageName];
    self.userNameLabel.text = model.userName;
    self.msgLabel.text = model.msg;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
