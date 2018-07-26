//
//  LogisticsCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/21.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "LogisticsCell.h"

@interface LogisticsCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation LogisticsCell

- (void)setModel:(LogistcModel *)model{
    _model = model;
    if (model.isHide) {
        self.line.hidden = YES;
    }else{
        self.line.hidden = NO;
    }
    self.dateLabel.text = model.date;
    self.timeLabel.text = model.time;
    if (model.title.length > 0) {
        [YTTool setLabelAttributeStr:model.title textColor:RGB(51, 51, 51) fontSize:15.0 otherStr:[NSString stringWithFormat:@"\n%@",model.msg] otherTextColor:RGB(153, 153, 153) otherSize:12.0 label:self.msgLabel];
    }else{
        self.logoView.image = [UIImage imageNamed:@"logisticsIconGray"];
        self.msgLabel.text = model.msg;
        self.dateLabel.font = [UIFont systemFontOfSize:12.5];
        self.dateLabel.textColor = RGB(153, 153, 153);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
