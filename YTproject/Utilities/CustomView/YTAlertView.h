//
//  YTAlertView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^YTAlertButtonClick)(NSInteger buttonIndex);

@interface YTAlertView : NSObject

@property (copy ,nonatomic) YTAlertButtonClick buttonClickHandle;

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)massage style:(UIAlertControllerStyle)style cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...;
- (void)show;
- (void)showWithRootVc:(UIViewController *)rootVc;
- (void)dismiss;

@end
