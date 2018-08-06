//
//  AppDelegate.m
//  YTproject
//
//  Created by suhuahao on 2018/7/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "AppDelegate.h"
#import "YTTabBarViewController.h"
#import "YTRotateViewController.h"
#import "YTLoginViewController.h"
#import "YTNavigationViewController.h"
#import <FLEXManager.h>
#import "YTLaunchView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupDebugTool];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:YTVersion];

    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[YTVersion];

    if ([currentVersion isEqualToString:lastVersion]){
        
        YTLoginViewController *loginVc = [[YTLoginViewController alloc]init];
        YTNavigationViewController *naVc = [[YTNavigationViewController alloc]initWithRootViewController:loginVc];
        loginVc.title = @"登录";
        self.window.rootViewController = naVc;

    }else{
        YTRotateViewController *rotateVc = [[YTRotateViewController alloc]init];
        self.window.rootViewController = rotateVc;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:YTVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.window makeKeyAndVisible];
    [self guide];
    [YTLaunchView showLaunchViewWithDefaultImage:[UIImage imageNamed:@"default"] webImageUrl:@""];
    return YES;
}

- (void)setTableViewConfig{
    if (@available(iOS 11.0,*)) {
//        UITableView.appearance.estimatedRowHeight = 0;
//        UITableView.appearance.estimatedSectionHeaderHeight = 0;
//        UITableView.appearance.estimatedSectionFooterHeight = 0;
    }
}

- (void)setupDebugTool{
    
#if DEBUG
//    [[[NSBundle alloc]initWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"]load];
    [[FLEXManager sharedManager]showExplorer];
    
#endif
}




- (void)guide{
    [YTHttpTool requestWithUrlStr:YTGuideUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
