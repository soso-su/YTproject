//
//  YTAddEducationViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"
#import "EducationModel.h"

@interface YTAddEducationViewController : YTBaseViewController

//model
@property (nonatomic, strong) EducationModel *edModel;

@property (nonatomic, assign) BOOL isAdd;

@end
