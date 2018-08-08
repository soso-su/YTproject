//
//  WorkExperienceModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/7.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkExperienceModel : NSObject

//公司名称
@property (nonatomic, strong) NSString *company_name;

//职位名称
@property (nonatomic, strong) NSString *position_name;

//开始时间
@property (nonatomic, strong) NSString *start_time;

//结束时间
@property (nonatomic, strong) NSString *end_time;

//工作内容
@property (nonatomic, strong) NSString *work_content;

//工作经历id
@property (nonatomic, assign) NSInteger work_experience_id;


@end
