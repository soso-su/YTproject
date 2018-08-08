//
//  YTEducationExperienceTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEducationExperienceTableViewCell.h"

@interface YTEducationExperienceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;

@end

@implementation YTEducationExperienceTableViewCell

- (void)setModel:(EducationModel *)model{
    _model = model;
    self.educationLabel.text = [NSString stringWithFormat:@"%@   %@\n\n%@  %@",model.graduation_time,model.school,model.major,model.degree];
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
