//
//  YTProgressHUD.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "ActivityView.h"

#define bezelViewColor [UIColor colorWithRed:152/255 green:152/255 blue:152/255 alpha:0.7]
#define contentViewColor [UIColor whiteColor]
#define kTag 103146

@implementation YTProgressHUD

+ (void)showWithStatusStr:(NSString *)statusStr {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        [self dismissHUD];
        ActivityView *activity = [[ActivityView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shareIcon1"]];
        activity.center = CGPointMake(imageView.width/2, imageView.height/2.);
        [imageView addSubview:activity];
        
        [self configCustomHUDWithCustomView:imageView tipStr:statusStr];
    });
}

+ (void)showSuccessWithStr:(NSString *)successStr {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        [self dismissHUD];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"payIconSucceed"]];
        MBProgressHUD *hud = [self configCustomHUDWithCustomView:imageView tipStr:successStr];
        [hud hideAnimated:YES afterDelay:2];
    });
    
}

+ (void)showErrorWithStr:(NSString *)errorStr {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        
        [self dismissHUD];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"payIconFailed"]];
        MBProgressHUD *hud = [self configCustomHUDWithCustomView:imageView tipStr:errorStr];
        [hud hideAnimated:YES afterDelay:2];
    });
}

+ (void)dismissHUD {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [window viewWithTag:kTag];
    if (hud) {
        [hud removeFromSuperview];
    }
}

+ (MBProgressHUD *)configCustomHUDWithCustomView:(UIView *)customView tipStr:(NSString *)tipStr {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.tag = kTag;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.layer.cornerRadius = 10;
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.backgroundColor =  [[UIColor blackColor] colorWithAlphaComponent:0.5];;
    hud.contentColor = [UIColor whiteColor];
    hud.customView = customView;
    if (tipStr) {
        hud.label.text = tipStr;
        hud.label.numberOfLines = 10;
        hud.label.preferredMaxLayoutWidth = 200;
    }
    return hud;
}

@end
