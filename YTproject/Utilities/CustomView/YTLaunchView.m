//
//  YTLaunchView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/31.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLaunchView.h"

@interface YTLaunchView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YTLaunchView

+ (void)showLaunchViewWithDefaultImage:(UIImage *)image webImageUrl:(NSString *)urlStr{
    YTLaunchView *launchView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    launchView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    launchView.imageView.image = image;
    NSURL *url = [NSURL URLWithString:urlStr];
    [launchView.imageView sd_setImageWithURL:url placeholderImage:image];
    [[YTTool getWindow] addSubview:launchView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [launchView removeFromSuperview];
    });
}

@end
