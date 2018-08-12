//
//  YTExpectaionWorkTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTExpectaionWorkTableViewCell.h"
@interface YTExpectaionWorkTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation YTExpectaionWorkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setResumeModel:(ResumeModel *)resumeModel{
    _resumeModel = resumeModel;
    NSString *tystr = @"全职";
    if (resumeModel.resume.expected_type == 1) {
        tystr = @"兼职";
    }else if (resumeModel.resume.expected_type == 2){
        tystr = @"实习";
    }
    self.msgLabel.text = [NSString stringWithFormat:@"%@\n\n%@/%@/%@\n\n期望行业   互联网",resumeModel.resume.expected_position,tystr,resumeModel.resume.expected_live,resumeModel.resume.expected_money];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
