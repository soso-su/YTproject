//
//  RecordHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordListModel.h"

typedef void(^CallBack)(RecordListModel *model);

@interface RecordHeadView : UIView

+ (instancetype)showRecordHeadView;

@property (nonatomic ,strong) RecordListModel *model;

@property (nonatomic ,copy) CallBack callback;

@end
