//
//  ReviewHeader.h
//  YTproject
//
//  Created by suhuahao on 2018/7/15.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ReviewHeaderDelegate <NSObject>
- (void)pushReviewMessage:(NSString *)msg;
@end

@interface ReviewHeader : UIView

+ (instancetype)showHeaderView;
@property (nonatomic, assign) id<ReviewHeaderDelegate>delegate;

@end
