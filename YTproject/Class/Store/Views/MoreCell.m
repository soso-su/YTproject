//
//  MoreCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "MoreCell.h"

@interface MoreCell()
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;

@end

@implementation MoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIsCollect:(BOOL)isCollect{
    _isCollect = isCollect;
    if (isCollect) {
        self.sellLabel.hidden = YES;
    }else{
        self.collectBtn.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
