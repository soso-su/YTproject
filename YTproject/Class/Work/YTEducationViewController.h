//
//  YTEducationViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"
#import "YTWorkTypeModel.h"

@interface YTEducationViewController : YTBaseViewController
@property (strong,nonatomic)NSArray <Level2 *>*list;
@property (nonatomic,assign)NSInteger type;

@end
