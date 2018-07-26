//
//  YTProgressHUD.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTProgressHUD : NSObject

+ (void)showWithStatusStr:(NSString *)statusStr;
+ (void)showSuccessWithStr:(NSString *)successStr;
+ (void)showErrorWithStr:(NSString *)errorStr;
+ (void)dismissHUD;

@end
