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

- (void)clickApplicantBtn:(BOOL)education;

@end

@interface CPWorkCell : UITableViewCell

@property (nonatomic, assign)id <CPWorkCellDelegate>delegate;

@property (nonatomic, assign)BOOL education;

@end
