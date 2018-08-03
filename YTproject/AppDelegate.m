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
#import "YTRongYunRequest.h"
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
    [self setRongYun];
    [self setTableViewConfig];
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

- (void)setRongYun{
    [[RCIM sharedRCIM] initWithAppKey:YTRongYun_AppKey];
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    [[RCIM sharedRCIM] setGroupInfoDataSource:self];
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    [[RCIM sharedRCIM] setReceiveMessageDelegate:self];
    //开启消息撤回功能
    [[RCIM sharedRCIM] setEnableMessageRecall:YES];
    [[RCIM sharedRCIM] setEnableMessageMentioned:YES];
    [[RCIM sharedRCIM] setGlobalMessageAvatarStyle:RC_USER_AVATAR_CYCLE];
    //开启已读回执功能
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList = @[@(ConversationType_PRIVATE)];
    [self connectServer];
}


- (void)guide{
    [YTHttpTool requestWithUrlStr:YTGuideUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)connectServer{
    NSDictionary *dic = @{@"userId":@"yt1",
                          @"name":@"英图",
                          @"portraitUri":@"https://www.woyaogexing.com/touxiang/weixin/2018/633800.html"};
    [YTRongYunRequest getTokenWithDict:dic success:^(id responseObject) {
        YTLog(@"obj = %@",responseObject);
    } failure:^(NSError *error) {
        YTLog(@"error = %@",error);
    }];
    
    [[RCIM sharedRCIM] connectWithToken:@"2pFotVBMoNxhjsfsihZjllte8zY03WYu7i357HgVkBO7ke3WuhpqcrkkomgTf2Ek3D6dEUM4VRs=" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);

    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%zd", status);
    } tokenIncorrect:^{
        NSLog(@"token错误");
    }];
}


- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    if ([userId isEqual:kGetUserId]) {
        RCUserInfo *user = [[RCUserInfo alloc] init];
        user.userId = kGetUserId;
        user.name = kNickname;
        user.portraitUri = kHeaderUrl;
        return completion(user);
    }
}

- (void)getGroupInfoWithGroupId:(NSString *)groupId completion:(void (^)(RCGroup *))completion {
    YTLog(@"groupid = %@",groupId);
}

- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    if (status==ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        [self.window endEditing:YES];
        [[RCIM sharedRCIM] disconnect:NO];
        YTLog(@"账号被踢下线");
    }
}

- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    if (left>0) { return; }
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
