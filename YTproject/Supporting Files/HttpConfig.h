//
//  HttpConfig.h
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#ifndef HttpConfig_h
#define HttpConfig_h
#endif

#define YTBaseUrl  @"http://192.168.1.35:8081"


#define YTHttpState_RequestIng @"加载中..."
#define YTHttpState_RequestFail @"请求失败，请检查您的网络"
#define YTHttpState_RequestCatch @"数据异常"

/***************************用户端*****************************/

#pragma mark ------------------注册登录-------------------

//启动页接口
#define YTGuideUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/guide"]

//注册接口
#define YTRegisterUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/register"]

//注册协议接口
#define YTAgreementUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/agreement"]

//登录接口
#define YTLoginUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/login"]


#pragma mark ------------------用户端-工作-------------------

//主页接口
#define YTIndexUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/index"]

//职位详情接口
#define YTPositionDetailUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/positionDetail"]

//公司详情接口
#define YTCompanyDetailUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/companyDetail"]

//发送简历接口
#define YTSendResumeUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/sendResume"]

//工作关键字搜索接口
#define YTFindPositionUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/findPosition"]

//行业分类接口
#define YTTradeUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/Trade"]

