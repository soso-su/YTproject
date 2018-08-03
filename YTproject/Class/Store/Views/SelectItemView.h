//
//  SelectItemView.h
//  YTproject
//
//  Created by suhuahao on 2018/8/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectItemViewDelegate

- (void)clickItemWithIndex:(NSInteger)index;

@end

@interface SelectItemView : UIView

@property (nonatomic, assign) id <SelectItemViewDelegate> delegate;

@end
