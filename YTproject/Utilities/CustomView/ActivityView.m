//
//  ActivityView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ActivityView.h"

@implementation ActivityView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    NSInteger count = 12;
    CGFloat angle = M_PI * 2 / 12;
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.bounds;
    repL.instanceCount = count;
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    repL.instanceDelay = 1/ 12.;
    [self.layer addSublayer:repL];
    
    CGFloat itemH = 10;
    CGFloat itemW = 4;
    CALayer *layer0 = [CALayer layer];
    layer0.position = CGPointMake(self.bounds.size.width / 2, itemH / 2.);
    layer0.bounds = CGRectMake(0, 0, itemW, itemH);
    layer0.backgroundColor = [UIColor whiteColor].CGColor;
    layer0.cornerRadius = itemW / 2.;
    [repL addSublayer:layer0];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(self.bounds.size.width / 2, itemH / 2.);
    layer.bounds = CGRectMake(0, 0, itemW, itemH);
    layer.opacity = 0;
    layer.backgroundColor = [UIColor colorWithRed:129/255. green:202/255. blue:255/255. alpha:1].CGColor;
    layer.cornerRadius = itemW / 2.;
    
    [repL addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"opacity";
    anim.fromValue = @1;
    anim.toValue = @0;
    anim.duration = 1;
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    [layer addAnimation:anim forKey:nil];
    
}

@end
