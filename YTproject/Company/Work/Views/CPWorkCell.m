//
//  CPWorkCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPWorkCell.h"



@implementation CPWorkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setEducation:(BOOL)education{
    _education = education;
}

- (IBAction)deleteWork:(UIButton *)sender {
    [self.delegate clickDeleteBtn];
}
- (IBAction)shareWork:(UIButton *)sender {
    [self.delegate clickShareBtn];
}
- (IBAction)checkApplicant:(UIButton *)sender {
    [self.delegate clickApplicantBtn:self.education];
}

@end
