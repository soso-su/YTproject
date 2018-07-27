//
//  CPEducationCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPEducationCell.h"

@interface CPEducationCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideMsgViewConstraint;
@property (weak, nonatomic) IBOutlet UIView *msgView;
@property (weak, nonatomic) IBOutlet UIButton *interViewBtn;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation CPEducationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIsHide:(BOOL)isHide{
    if (isHide) {
        self.msgView.hidden = YES;
        self.hideMsgViewConstraint.priority = 999;
    }else{
        self.msgView.hidden = NO;
        self.hideMsgViewConstraint.priority = 250;
    }
}
- (IBAction)clickPass:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate passInterView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
