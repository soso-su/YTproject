//
//  RecordHeadView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "RecordHeadView.h"

@interface RecordHeadView()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet YTTouchView *jobView;

@end

@implementation RecordHeadView

+ (instancetype)showRecordHeadView{
    RecordHeadView *headView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return headView;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setModel:(RecordListModel *)model{
    _model = model;
    self.stateLabel.text = [NSString stringWithFormat:@"当前申请状态：%@",model.recordStateStr];
    self.jobView.touchHandler = ^{
        self.callback(model);
    };
}



@end
