//
//  YTEducaCollectViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"
#import "YTWorkTypeModel.h"

@interface YTEducaCollectViewController : YTBaseViewController
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, strong)NSArray <Level3*>*list;

@end
