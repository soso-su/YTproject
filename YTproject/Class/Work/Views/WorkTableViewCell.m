//
//  WorkTableViewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/5.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "WorkTableViewCell.h"

@interface WorkTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *companyLogo;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *companyMsg;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;

@end

@implementation WorkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(PositionModel *)model{
    _model = model;
    self.positionLabel.text = model.position_name;
    self.areaLabel.text = [NSString stringWithFormat:@"%@",model.area];
    self.timeLabel.text = model.created_time;
    self.moneyLabel.text = [NSString stringWithFormat:@"%zdk-%zdk",model.hight_money,model.low_money];
}

@end
