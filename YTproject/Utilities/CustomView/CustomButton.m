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
    
    [self setupInit];
//    [self setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
//    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize > 0 ? self.fontSize:14.0];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setupInit];
    
    [self setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize > 0 ? self.fontSize:14.0];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupButton];
}


- (void)setupButton{
    
    if (self.customButtonType == ImageUpLabelDown) { //图片在上，文字在下
       
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.width, -self.imageView.height, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(-self.imageView.height - self.margin, 0, 0, -self.titleLabel.intrinsicContentSize.width);
        
    } else if (self.customButtonType == ImageLeftLabelRight){
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(self.margin*2, 0, self.titleLabel.width, self.titleLabel.height);
        self.titleLabel.centerY = self.height/2;
        
        [self.imageView sizeToFit];
        self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+self.margin, 0, self.imageView.width, self.imageView.height);
        self.imageView.centerY = self.height/2;
    }else {
        
        self.imageView.frame = CGRectMake(self.margin, self.margin, self.width - self.margin * 2, self.height/2 - self.margin * 2);
        self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + self.margin*2, self.width, self.height/2 - self.margin * 2);
    }
}

- (void)setupInit{
    self.margin = 3;
}

#pragma mark =======================SetterGetter=========================
-(void)setCustomButtonType_IBInspector:(NSInteger)customButtonType_IBInspector{
    self.customButtonType = customButtonType_IBInspector;
}

-(NSInteger)customButtonType_IBInspector{
    return self.customButtonType;
}

@end
