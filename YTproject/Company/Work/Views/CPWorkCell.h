//
//  CPWorkCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPWorkCellDelegate <NSObject>

- (void)clickDeleteBtn;

- (void)clickShareBtn;

@end

@interface CPWorkCell : UITableViewCell

@property (nonatomic, assign)id <CPWorkCellDelegate>delegate;

@end
