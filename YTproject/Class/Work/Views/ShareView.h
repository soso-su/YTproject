//
//  ShareView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareViewDelegate <NSObject>

- (void)clickCloseBtn;

@end

@interface ShareView : UIView

@property (nonatomic, assign)id <ShareViewDelegate>delegate;

@end
