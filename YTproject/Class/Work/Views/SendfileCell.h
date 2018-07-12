//
//  SendfileCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendfileCellDelegate <NSObject>

- (void)selectFile;

@end

@interface SendfileCell : UITableViewCell

@property (nonatomic, assign)id <SendfileCellDelegate>delegate;

@end
