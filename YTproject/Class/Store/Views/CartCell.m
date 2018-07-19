//
//  CartCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CartCell.h"

@interface CartCell()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reduce:(UIButton *)sender {
    NSInteger count = [self.countLabel.text integerValue];
    count++;
    self.countLabel.text = [NSString stringWithFormat:@"%zd",count];
}

- (IBAction)add:(UIButton *)sender {
    NSInteger count = [self.countLabel.text integerValue];
    count--;
    if (count<0) {
        count = 0;
    }
    self.countLabel.text = [NSString stringWithFormat:@"%zd",count];
}

@end
