//
//  YTWorkSearchViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"

@interface YTWorkSearchViewController : YTBaseViewController

@property (nonatomic, assign) BOOL isCompany;

//搜索条件
@property (nonatomic, strong) NSString *searchText;

@end
