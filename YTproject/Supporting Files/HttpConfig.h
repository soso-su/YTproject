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



#pragma mark ------------------用户端-本地-------------------


//活动接口
#define YTNativeList [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/nativeList"]

//活动、美食或旅游详情接口
#define YTNativeDetail [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/nativeDetail"]


//点赞\收藏\取消点赞\取消收藏接口
#define YTAddCollection [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addCollection"]

//评论接口
#define YTAddComment [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addComment"]

//其他人的评论接口
#define YTOtherComment [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/otherComment"]

//给评论点赞\取消点赞接口
#define YTGood [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/good"]

//搜索本地接口
#define YTFindNative [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/findNative"]


#pragma mark ------------------用户端-服务-------------------

//分类具体接口
#define YTSpecificService [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/specificService"]

//服务分类接口
#define YTServiceAssortment [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/serviceAssortment"]


//服务详情接口
#define YTServiceDetail [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/serviceDetail"]


//搜索服务接口
#define YTFindService [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/findService"]

#pragma mark ------------------用户端-商城-------------------

//商品详情接口
#define YTGoodsDetail [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/goodsDetail"]

//英途推荐商品接口
#define YTRecommend [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/recommend"]

//轮播图接口
#define YTShufList [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/shufList"]


//商品分类列表接口
#define YTGoodsAssortment [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/goodsAssortment"]

//当季热卖商品接口
#define YTHotSale [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/hotSale"]

//新品上市商品接口
#define YTNewGoods [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/newGoods"]

//分类的商品接口
#define YTAssortmentGoods [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/AssortmentGoods"]

//搜索商品接口
#define YTFindGoods [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/findGoods"]


#pragma mark ------------------用户端-我的-------------------

//添加认证接口
#define YTAddIdentification [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addIdentification"]

//修改密码接口
#define YTModifyPassword [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyPassword"]

//修改生日接口
#define YTModifyBirthday [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyBirthday"]


//修改性别接口
#define YTModifySex [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifySex"]

//修改性别接口
#define YTModifySex [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifySex"]

//修改邮箱接口
#define YTModifyEmail [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyEmail"]

//修改电话接口
#define YTModifyPhone [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyPhone"]

//修改昵称接口
#define YTModifyNickName [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyNickName"]

//修改头像接口
#define YTModifyHead [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/modifyHead"]


//我的积分接口
#define YTMyIntegral [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/myIntegral"]

//关于我们接口
#define YTAbout [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/about"]

//我的收藏接口
#define YTCollectionList [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/collectionList"]

//实名认证接口
#define YTRealNameVerify [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/realNameVerify"]

//认证类型接口
#define YTVerifyList [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/verifyList"]

//投递记录接口
#define YTResumeRecord [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/resumeRecord"]

//添加反馈接口
#define YTAddFeedback [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/addFeedback"]

//添加反馈接口
#define YTPersonal [NSString stringWithFormat:@"%@/%@", YTBaseUrl, @"user/personal"]

