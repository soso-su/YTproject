//
//  WorkHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/4.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkHotModel.h"
#import "CarouselModel.h"
@class WorkHeadView;
@protocol WorkHeadViewDelegate <NSObject>

- (void)clickCollectViewCellWithIndex:(WorkHotModel *)model;

@end

@interface WorkHeadView : UIView

@property (nonatomic, assign)id <WorkHeadViewDelegate>delegate;

@property (nonatomic, strong)NSArray <WorkHotModel *>*dataSorce;

@property (nonatomic, strong)NSArray <CarouselModel *>*imgArray;

@end
