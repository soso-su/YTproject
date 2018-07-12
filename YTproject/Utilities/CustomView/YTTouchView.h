//
//  YTTouchView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchViewHandler)(void);

@interface YTTouchView : UIView

@property (nonatomic,copy)TouchViewHandler touchHandler;

@end
