//
//  YTUserModel.h
//  YTproject
//
//  Created by suhuahao on 2018/7/30.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface YTUserModel : NSObject

+(instancetype)share;
@property (nonatomic , assign) NSInteger  type;//用户类型(0个人 1公司)
@property (nonatomic , assign) NSInteger  account_type;//账号类型0手机1邮箱
@property (nonatomic , copy) NSString  * token;
@property (nonatomic , strong) Person  * person;


@end

@interface Person :NSObject
@property (nonatomic , assign) NSInteger  appId;//id
@property (nonatomic , copy) NSString  * created_time;//创建时间
@property (nonatomic , copy) NSString  * iD_number;//身份证号
@property (nonatomic , copy) NSString  * phone;//电话
@property (nonatomic , assign) NSInteger  sex;//性别
@property (nonatomic , assign) NSInteger  state;//认证状态（0待认证1通过2不通过）
@property (nonatomic , copy) NSString  * avatar_url;//头像
@property (nonatomic , copy) NSString  * uuid;//uuid
@property (nonatomic , copy) NSString  * nick_name;//昵称
@property (nonatomic , copy) NSString  * img;//护照图片
@property (nonatomic , copy) NSString  * birthday;//生日
@property (nonatomic , copy) NSString  * integral;//
@property (nonatomic , assign) NSInteger  u_id;//用户id
@property (nonatomic , copy) NSString  * email;//邮箱
@property (nonatomic , copy) NSString  * name;//真实姓名
@end
