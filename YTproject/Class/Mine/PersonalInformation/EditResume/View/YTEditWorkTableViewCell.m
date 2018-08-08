//
//  YTEditWorkTableViewCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEditWorkTableViewCell.h"

@interface YTEditWorkTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation YTEditWorkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(WorkExperienceModel *)model{
    _model = model;
    self.timeLabel.text = [NSString stringWithFormat:@"%@-%@",model.start_time,model.end_time];
    self.msgLabel.text = model.work_content;
}

- (void)setEdModel:(EducationModel *)edModel{
    _edModel = edModel;
    self.timeLabel.text = [NSString stringWithFormat:@"%@  %@",edModel.graduation_time,edModel.school];
    self.msgLabel.text = [NSString stringWithFormat:@"%@  %@",edModel.major,edModel.degree];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)clickEditBtn:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate editWorkExperience];
    }
}

@end
