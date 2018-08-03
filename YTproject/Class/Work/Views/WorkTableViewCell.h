//
//  WorkTableViewCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/5.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PositionModel.h"

@interface WorkTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic)PositionModel *model;

@end
