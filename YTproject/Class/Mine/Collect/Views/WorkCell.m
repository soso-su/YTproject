//
//  WorkCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "WorkCell.h"

@interface WorkCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *companyName;

@property (weak, nonatomic) IBOutlet UILabel *jobLabel;

@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@property (weak, nonatomic) IBOutlet UILabel *treatmentLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end


@implementation WorkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIsCollect:(BOOL)isCollect{
    _isCollect = isCollect;
    if (isCollect) {
        self.stateLabel.hidden = YES;
    }else{
        self.collectBtn.hidden = YES;
    }
}

- (void)setList:(RecordListModel *)list{
    _list = list;
    self.stateLabel.text = list.recordStateStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
