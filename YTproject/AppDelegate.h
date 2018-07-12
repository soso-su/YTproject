//
//  AppDelegate.h
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,RCIMUserInfoDataSource, RCIMGroupInfoDataSource, RCIMConnectionStatusDelegate, RCIMReceiveMessageDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

