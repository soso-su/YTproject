//
//  YTWorkExperienceTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkExperienceTableViewCell.h"

@interface YTWorkExperienceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *workLabel;

@end

@implementation YTWorkExperienceTableViewCell

- (void)setModel:(WorkExperienceModel *)model{
    _model = model;
    self.workLabel.text = [NSString stringWithFormat:@"%@-%@\n\n%@",model.start_time,model.end_time,model.work_content];
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
