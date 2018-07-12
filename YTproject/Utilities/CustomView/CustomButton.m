//
//  CustomButton.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize > 0 ? self.fontSize:14.0];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize > 0 ? self.fontSize:14.0];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat margin = 3;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (self.type == 1) {
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(margin*2, 0, self.titleLabel.width, self.titleLabel.height);
        self.titleLabel.centerY = self.height/2;
        
        [self.imageView sizeToFit];
        self.imageView.frame = CGRectMake(self.width - self.imageView.width - margin *2, 0, self.imageView.width, self.height - margin * 2);
        
        self.imageView.centerY = self.height/2;
        
    }else {
        
        self.imageView.frame = CGRectMake(margin, margin, self.width - margin * 2, self.height/2 - margin * 2);
        self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + margin*2, self.width, self.height/2 - margin * 2);
    }
    
}

@end
