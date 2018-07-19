//
//  SelectSexView.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SexType){
    Boy = 0,
    Girl,
};

typedef void(^SelectedBlock)(SexType);

@interface YTSelectSexView : UIView

@property (nonatomic,assign)SexType sexType;

+(void)showWithDefaultSelectIndex:(SexType)sexType SelectBlock:(SelectedBlock)block;

@end
