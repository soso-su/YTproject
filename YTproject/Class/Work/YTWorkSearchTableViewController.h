//
//  YTWorkSearchTableViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/8.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"
#import "PositionModel.h"

@interface YTWorkSearchTableViewController : YTBaseViewController

@property (nonatomic, assign)NSInteger type;

//数据源
@property (nonatomic, strong) NSMutableArray <PositionModel *>*positionList;

@end
