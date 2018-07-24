//
//  YTSearchView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YTSearchViewDelegate <NSObject>

- (void)searchTextFieldDidBeginEditing:(UITextField *)textField;

- (void)searchTextFieldDidEndEditing:(UITextField *)textField;

- (BOOL)searchTextFieldShouldReturn:(UITextField *)textField;

@end

@interface YTSearchView : UIView

@property (nonatomic, strong)NSString *placeholder;
@property (nonatomic, strong)NSString *text;
@property (nonatomic, assign)id<YTSearchViewDelegate>delegate;

@end
