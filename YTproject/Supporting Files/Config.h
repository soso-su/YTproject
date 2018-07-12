//
//  Config.h
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#ifndef Config_h
#define Config_h
#endif

//融云appkey和AppSecret
#define YTRongYun_AppKey @"e5t4ouvpe62ea"
#define YTRongYun_AppSecret @"x4INMclLHS0o"

//获取融云token
#define YTGetRongYunTokenUrl  @"https://api.cn.ronghub.com/user/getToken.json"

//通知
#define YTEDCATIONNOTIFICATIONNAME @"edcationNotification"

#define kGetUserId          [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"]
#define kNickname           [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"]
#define kHeaderUrl          [[NSUserDefaults standardUserDefaults] objectForKey:@"head_path"]
