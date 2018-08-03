//
//  YTShowStateView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//


#import "YTShowStateView.h"

@interface YTShowStateView()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation YTShowStateView

+ (void)showStateViewWithStr:(NSString *)str textColor:(UIColor *)textColor{
    YTShowStateView *stateView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    stateView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    stateView.backgroundColor = RGBAlpha(0, 0, 0, 0.5);
    stateView.showLabel.text = str;
    stateView.showLabel.textColor = textColor;
    [[YTTool getWindow] addSubview:stateView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [stateView removeFromSuperview];
    });
}



@end
