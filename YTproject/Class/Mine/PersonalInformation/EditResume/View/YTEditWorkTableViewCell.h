//
//  YTEditWorkTableViewCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResumeModel.h"

@protocol YTEditWorkTableViewCellDelegate <NSObject>

- (void)editExperienceWithModel:(id)model;

@end


@interface YTEditWorkTableViewCell : UITableViewCell

@property (nonatomic, strong) WorkExperienceModel *model;

@property (nonatomic, strong) EducationModel *edModel;

@property (nonatomic, assign) BOOL isWork;

@property (nonatomic, assign)id <YTEditWorkTableViewCellDelegate>delegate;

@end
