//
//  OrderTipcView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TextType) {
    TextLeft = 0,
    TextCenter,
};

typedef void(^CallBall)(void);

@interface OrderTipcView : UIView
@property (nonatomic ,strong) NSString *showStr;
@property (nonatomic, assign) TextType type;
+ (void)showWithStr:(NSString *)str type:(TextType)type callBack:(CallBall)block;


@end
