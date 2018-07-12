//
//  WorkAddressHeadView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkAddressHeadView : UIView
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UILabel *currentCityLabel;
@property (weak, nonatomic) IBOutlet UIButton *reloadCityBtn;
+ (instancetype)headView;
@end
