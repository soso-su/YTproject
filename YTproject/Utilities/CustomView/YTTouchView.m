//
//  YTTouchView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTTouchView.h"

@interface YTTouchView()
@property (nonatomic,strong)UIButton *touchBtn;
@end

@implementation YTTouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.touchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.touchBtn.frame=self.bounds;
        [self.touchBtn setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.touchBtn addTarget:self action:@selector(touchesBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.touchBtn];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.touchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.touchBtn.frame=self.bounds;
    [self.touchBtn setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.touchBtn addTarget:self action:@selector(touchesBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.touchBtn];
    
}

-(void)touchesBtnClick:(UIButton *)sender{
    if (self.touchHandler) {
        self.touchHandler();
    }
}


@end
