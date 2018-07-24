//
//  ApplyforFooterView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ApplyforFooterView.h"

@interface ApplyforFooterView()
@property (weak, nonatomic) IBOutlet UILabel *logisticsLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation ApplyforFooterView

+ (instancetype)showApplyforFooterView{
    ApplyforFooterView *footerView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return footerView;
}

- (void)setMsg:(NSString *)msg{
    _msg = msg;
    self.msgLabel.text = msg;
}

- (void)setState:(NSString *)state{
    _state = state;
    self.stateLabel.text = state;
}

- (void)setLogist:(NSString *)logist{
    _logist = logist;
    self.logisticsLabel.text = logist;
}

- (IBAction)writeLogist:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate editLogist];
    }
}


@end
