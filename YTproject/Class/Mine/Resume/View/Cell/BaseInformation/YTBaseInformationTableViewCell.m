//
//  YTBaseInformationTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseInformationTableViewCell.h"

@interface YTBaseInformationTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *baseLabel;

@end


@implementation YTBaseInformationTableViewCell

- (void)setModel:(ResumeModel *)model{
    _model = model;
    self.baseLabel.text = [NSString stringWithFormat:@"最高学历：%@\n\n工作年限：%zd\n\n出生年月：%@\n\n国籍：%@\n\n性别：%@\n\n语言：%@",model.resume.education,model.resume.working_life,model.resume.birthday,model.resume.nation,(model.resume.sex == 0 ? @"男":@"女"),model.resume.language];
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
