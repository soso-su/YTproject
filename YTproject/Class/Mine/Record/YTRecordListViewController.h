//
//  YTRecordListViewController.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"

typedef NS_ENUM(NSInteger,VcState){
    VcState_All = 0, //全部
    VcState_Check = 1, //被查看
    VcState_Interest = 2, //有兴趣
    VcState_MakeInterview = 3, //约面试
    VcState_PassInterview = 4, //通过面试
    VcState_NoFit = 5 //不合适
};

@interface YTRecordListViewController : YTBaseViewController
@property (nonatomic, assign) VcState vcState;


@end
