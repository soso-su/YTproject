//
//  WorkHotModel.h
//  YTproject
//
//  Created by suhuahao on 2018/7/31.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkHotModel : NSObject
@property (nonatomic , copy) NSString * abbreviation; //公司简称
@property (nonatomic , copy) NSString * money; //月薪
@property (nonatomic , assign) NSInteger p_id; //职位id
@property (nonatomic , assign) NSInteger postId; //职位id
@property (nonatomic , copy) NSString * position_name; //职位名称
@property (nonatomic , assign) NSInteger  b_id; //
@property (nonatomic , assign) NSInteger state; //
@property (nonatomic , assign) NSInteger u_id; //用户id
@property (nonatomic , copy) NSString * avatar_url; //公司头像
@property (nonatomic , copy) NSString * created_time;
@property (nonatomic , assign) NSInteger hight_money;
@property (nonatomic , assign) NSInteger low_money;


@end

