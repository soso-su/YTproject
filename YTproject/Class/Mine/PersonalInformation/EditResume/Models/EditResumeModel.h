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

//期望职位
@property (nonatomic, strong) NSString *expected_position;

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

//其他证书
@property (nonatomic, strong) NSString *other_certificates;

//证书备注
@property (nonatomic, strong) NSString *certificates_remark;


@end
