//
//  RecordMsgModel.h
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordMsgModel : NSObject

@property (nonatomic ,strong) NSString *title;

@property (nonatomic ,strong) NSString *time;

@property (nonatomic ,assign) BOOL hideLine;

@property (nonatomic ,assign) BOOL isRed;

@property (nonatomic ,assign) BOOL isShowLetter;


@end
