//
//  ResumeModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditResumeModel.h"
#import "WorkExperienceModel.h"
#import "EducationModel.h"

@interface ResumeModel : NSObject

@property (nonatomic , strong) EditResumeModel   *resume;

@property (nonatomic , strong) NSArray<WorkExperienceModel *> * workExperienceList;

@property (nonatomic , strong) NSArray<EducationModel *>              *eduExperienceList;

@end

