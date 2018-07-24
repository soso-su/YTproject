//
//  RefundCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "RefundCell.h"

@interface RefundCell()

@end

@implementation RefundCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectItem:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
