//
//  OtherComboTableViewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "OtherComboTableViewCell.h"
@interface OtherComboTableViewCell()


@end

@implementation OtherComboTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickSelectBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
