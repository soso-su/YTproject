//
//  EducationModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/8.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EducationModel : NSObject

//学校名称
@property (nonatomic, strong) NSString *school;

//专业
@property (nonatomic, strong) NSString *major;

//毕业时间
@property (nonatomic, strong) NSString *graduation_time;

//学位
@property (nonatomic, strong) NSString *degree;

//id
@property (nonatomic, assign) NSInteger edu_id;


@property (nonatomic, assign) NSInteger r_id;

@end
