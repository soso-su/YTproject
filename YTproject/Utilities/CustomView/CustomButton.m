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
        //在确保label文字和指定的imageView能正确显示的前提下，对button的大小进行调整
        [self.titleLabel sizeToFit];
        if (self.imageViewSize.width == 0 && self.imageViewSize.height == 0) {
            [self.imageView sizeToFit];
        }else{
            self.imageView.size = self.imageViewSize;
        }
        
        //调整button大小
        self.height = MAX(self.height, self.titleLabel.height + self.margin + self.imageView.height);
        self.width = self.imageView.width > self.titleLabel.width ? MAX(self.width, self.imageView.width):MAX(self.width, self.titleLabel.width);
        
        //调整label
        self.titleLabel.centerX = self.width/2;
        self.titleLabel.y = self.height - self.titleLabel.height;
        //调整图片
        self.imageView.centerX = self.width/2;
        self.imageView.y = self.titleLabel.y - self.margin - self.imageView.height;
        
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
