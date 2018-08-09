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

#define YTBaseUrl   @"http://120.77.55.33"//@"http://192.168.1.35:8081"//@"http://120.77.55.33"


#define YTHttpState_RequestIng @"加载中..."
#define YTHttpState_RequestFail @"请求失败，请检查您的网络"
#define YTHttpState_RequestCatch @"数据异常"



/***************************用户端*****************************/

#pragma mark ------------------上传图片-------------------

#define YTUploadImageUrl [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/upload"]


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


//简历详情
#define YTResumeDetail [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/resumeDetail1"]


//添加简历
#define YTAddResume [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/alterResume1"]

//编辑简历期望工作接口
#define YTEditResume [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/alterResume2"]

//编辑工作经历接口
#define YTModifyWorkExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyWorkExperience"]

//添加工作经历接口
#define YTAddWorkExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addWorkExperience"]

//删除工作经历接口
#define YTDelWorkExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/delWorkExperience"]


//编辑教育经历接口
#define YTModifyEduExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyEduExperience"]

//添加教育经历接口
#define YTAddEduExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addEduExperience"]

//删除教育经历接口
#define YTDelEduExperience [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/delEduExperience"]

//编辑简历资格证书接口
#define YTEditCertificate [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/alterResume3"]







