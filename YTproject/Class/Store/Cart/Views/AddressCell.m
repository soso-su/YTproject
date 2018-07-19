//
//  AddressCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "AddressCell.h"

@implementation AddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectDefault:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)edit:(UIButton *)sender {
}
- (IBAction)deleteAddress:(UIButton *)sender {
}



@end
