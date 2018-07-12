//
//  SelectTypeView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTypeView : UIView

@property (nonatomic,assign)CGRect rect;

typedef void (^CallBack)(NSString *str);

@property (nonatomic, copy)CallBack callback;

@end
