//
//  YTDatePickerView.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DateSelectedBlock)(NSDate*);

@interface YTDatePickerView : UIView

+(void)showWithDefaultSelectDate:(NSDate *)date SelectBlock:(DateSelectedBlock)block;
@end
