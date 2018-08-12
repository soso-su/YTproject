//
//  YTTitleView.m
//  YTproject
//
//  Created by suhuahao on 2018/8/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTTitleView.h"

static NSInteger margin = 3;

@interface YTTitleView ()

@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation YTTitleView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel=[[UILabel alloc]init];
        self.titleLabel.frame = CGRectMake(margin, margin, self.width - margin * 2, self.height - margin*2);
        self.titleLabel.textColor = RGB(255, 67, 67);
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:self.titleLabel];
        self.layer.borderWidth = 1;
        self.layer.borderColor = RGB(255, 67, 67).CGColor;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel=[[UILabel alloc]init];
    self.titleLabel.frame = CGRectMake(margin, margin, self.width - margin * 2, self.height - margin*2);
    self.titleLabel.textColor = RGB(255, 67, 67);
    self.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.titleLabel];
    self.layer.borderWidth = 1;
    self.layer.borderColor = RGB(255, 67, 67).CGColor;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.size = CGSizeMake(self.titleLabel.width + margin*2, self.titleLabel.height + margin*2);
}


@end
