//
//  CarouselModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/1.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarouselModel : NSObject
@property (nonatomic , assign) NSInteger  locate;//轮播位置（0首页1商城）
@property (nonatomic , assign) NSInteger  carouselId;
@property (nonatomic , copy) NSString     * title;//轮播标题
@property (nonatomic , copy) NSString     * imgs;
@property (nonatomic , assign) NSInteger  type;//类型(0职位1公司2商品)
@property (nonatomic , copy) NSString     * created_time;
@property (nonatomic , assign) NSInteger  url;//外链id
@end
