//
//  AffirmOrderCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "AffirmOrderCell.h"

@interface AffirmOrderCell()
@property (weak, nonatomic) IBOutlet UILabel *leftCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *spLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightCountLabel;

@end

@implementation AffirmOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIsCart:(BOOL)isCart{
    _isCart = isCart;
    if (isCart) {
        self.spLabel.hidden = YES;
        self.rightCountLabel.hidden = YES;
        self.leftCountLabel.hidden = NO;
    }else{
        self.spLabel.hidden = NO;
        self.rightCountLabel.hidden = NO;
        self.leftCountLabel.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
