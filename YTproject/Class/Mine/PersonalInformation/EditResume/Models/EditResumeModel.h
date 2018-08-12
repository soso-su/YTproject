//
//  EditResumeModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/7.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EditResumeModel : NSObject

//0在线简历1附件简历
@property (nonatomic, strong) NSString *resume_type;

//附件简历url
@property (nonatomic, strong) NSString *url;

//简历名称
@property (nonatomic, strong) NSString *resume_name;

//姓名
@property (nonatomic ,strong) NSString *name;

//头像
@property (nonatomic, strong) NSString *avatar_url;

//国籍
@property (nonatomic, strong) NSString *nation;

//性别 0:男，1:女
@property (nonatomic, assign) NSInteger sex;

//语言
@property (nonatomic, strong) NSString *language;

//生日
@property (nonatomic, strong) NSString *birthday;

//学历
@property (nonatomic, strong) NSString *education;

//工作年限
@property (nonatomic, assign) NSInteger working_life;

//签证类型
@property (nonatomic, assign) NSInteger visa_type;

//描述自己
@property (nonatomic, strong) NSString *introduce;

//目前居住城市
@property (nonatomic, strong) NSString *live;

//教师资格证书
@property (nonatomic, strong) NSString *qualification;

//教师资格证书图片（预览使用）
@property (nonatomic, strong) UIImage *qualificationImage;

//其他证书
@property (nonatomic, strong) NSString *other_certificates;

//其他证书图片（预览使用）
@property (nonatomic, strong) UIImage *other_certificatesImage;

//其他证书备注
@property (nonatomic, strong) NSString *certificates_remark;

//公司人员数量
@property (nonatomic, assign) NSInteger expected_trade;

//期望职位
@property (nonatomic, strong) NSString *expected_position;

//期望工作城市
@property (nonatomic, strong) NSString *expected_live;

//期望薪资
@property (nonatomic, strong) NSString *expected_money;

//期望工作类型（0全职1兼职2实习）
@property (nonatomic, assign) NSInteger expected_type;

//补充说明
@property (nonatomic, strong) NSString *expected_supplement;

//预计到岗时间（0:一周, 1:本月内, 2:一个月内）
@property (nonatomic, assign) NSInteger on_position;




@end
