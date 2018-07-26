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
        //以button的高度为基准，在确保label文字能正确显示的前提下，对Imageview进行压缩
        
        CGFloat height = self.height;  //button高度
        [self.titleLabel sizeToFit];
        CGFloat labelHeight = self.titleLabel.height; //label高度，label需要完整显示
        CGFloat imageViewHeight = height - labelHeight - self.margin;//imageView压缩后的高度
        
        //调整图片
        [self.imageView sizeToFit];
        self.imageView.x = 0;
        self.imageView.y = 0;
        self.imageView.centerX = self.width/2;
        
        //imageView最大高度不超过压缩后的高度
        self.imageView.height = imageViewHeight;
        self.imageView.width = self.imageView.height >self.width ? self.width:self.imageView.width;
        //imageView最大宽度不超过button宽度
//        self.imageView.width = self.imageView.width > self.width ?self.width:self.imageView.width;
        
        
        //调整文字
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height + self.margin;
        self.titleLabel.centerX = self.width/2;
        
    } else if (self.customButtonType == ImageLeftLabelRight){
        
        [self.imageView sizeToFit];
        self.imageView.frame = CGRectMake(self.margin*2, 0, self.imageView.width, self.imageView.height);
        self.imageView.centerY = self.height/2;
        
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(self.width - self.titleLabel.width - self.margin*2, 0, self.titleLabel.width, self.titleLabel.height);
        self.titleLabel.centerY = self.height/2;
        
        
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
