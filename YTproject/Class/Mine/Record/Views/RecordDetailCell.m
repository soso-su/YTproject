//
//  RecordDetailCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "RecordDetailCell.h"

@interface RecordDetailCell ()
@property (weak, nonatomic) IBOutlet UIImageView *tipImageView;
@property (weak, nonatomic) IBOutlet UILabel *tiLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *letterView;

@property (weak, nonatomic) IBOutlet UILabel *letterLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideLetterViewConstraint;

@end

@implementation RecordDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setModel:(RecordMsgModel *)model{
    _model = model;
    self.letterView.hidden = YES;
    self.hideLetterViewConstraint.priority = 999;
    if (model.isShowLetter) {
        self.letterView.hidden = NO;
        self.hideLetterViewConstraint.priority = 250;
    }
    
    if (model.hideLine) {
        self.line.hidden = YES;
    }
    
    self.tiLabel.text = model.title;
    self.timeLabel.text = model.time;
    if (model.isRed) {
        self.tipImageView.image = [UIImage imageNamed:@"recondIconRed"];
        self.tiLabel.textColor = RGB(51, 51, 51);
        self.timeLabel.textColor = RGB(51, 51, 51);
    }else{
        self.tipImageView.image = [UIImage imageNamed:@"recondIconGray"];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
