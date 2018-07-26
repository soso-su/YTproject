//
//  WorkCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordListModel.h"

@interface WorkCell : UITableViewCell

@property (nonatomic, assign) BOOL isCollect;

@property (nonatomic, strong)RecordListModel *list;

@end
