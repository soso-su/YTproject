//
//  WorkHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WorkHeadView;
@protocol WorkHeadViewDelegate <NSObject>

- (void)clickCollectViewCellWithIndex:(NSInteger)index;

@end

@interface WorkHeadView : UIView

@property (nonatomic, assign)id <WorkHeadViewDelegate>delegate;

@end
