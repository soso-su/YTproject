//
//  MyComTableViewCell.h
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyComTableViewCellDelegate <NSObject>

- (void)buyCombo;

@end

@interface MyComTableViewCell : UITableViewCell
@property (nonatomic, assign)id <MyComTableViewCellDelegate>delegate;

@end
