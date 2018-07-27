//
//  CPEducationCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPEducationCellDelegate <NSObject>

- (void)passInterView;

@end

@interface CPEducationCell : UITableViewCell

@property (nonatomic, assign) BOOL isHide;

@property (nonatomic, assign) id<CPEducationCellDelegate>delegate;

@end
