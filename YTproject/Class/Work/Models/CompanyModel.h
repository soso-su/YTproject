//
//  CompanyModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyModel : NSObject

//公司地址
@property (nonatomic, strong) NSString *address;

//公司简称
@property (nonatomic, strong) NSString *abbreviation;

//公司详情
@property (nonatomic, strong) NSString *company_name;

//公司人员数量
@property (nonatomic, assign) NSInteger number;

//用户id
@property (nonatomic, assign) NSInteger u_id;

//公司头像
@property (nonatomic, strong) NSString *avatar_url;

//标签
@property (nonatomic, strong) NSString *label;

//公司基本情况
@property (nonatomic, strong) NSString *basic;

@end
