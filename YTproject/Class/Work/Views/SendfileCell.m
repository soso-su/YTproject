//
//  SendfileCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "SendfileCell.h"

@implementation SendfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)clickCheckBtn:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate selectFile];
    }
}
- (IBAction)clickSelectBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
