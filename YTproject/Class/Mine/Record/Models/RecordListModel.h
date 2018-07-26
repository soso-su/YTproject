//
//  RecordListModel.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,RecordState){
    RecordState_Check = 0, //被查看
    RecordState_Interest = 1, //有兴趣
    RecordState_MakeInterview = 2, //约面试
    RecordState_PassInterview = 3, //通过面试
    RecordState_NoFit = 4, //不合适
    RecordState_Send = 5 //已投递
};

@interface RecordListModel : NSObject


@property (nonatomic ,strong) NSString *recordStateStr;

@property (nonatomic, assign) RecordState recordState;

@end
