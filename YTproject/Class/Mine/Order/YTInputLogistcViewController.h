//
//  YTInputLogistcViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/23.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"

typedef void (^CallBack)(NSString *str);

@interface YTInputLogistcViewController : YTBaseViewController
@property (nonatomic, copy)CallBack callback;
@end
