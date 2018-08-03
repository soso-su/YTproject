//
//  PositionModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/1.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionModel : NSObject

@property (nonatomic , copy) NSString  *education;//学历
@property (nonatomic , copy) NSString  *language;//语言
@property (nonatomic , assign) NSInteger hight_money;//最高薪资
@property (nonatomic , assign) NSInteger position_state;//职位状态（0正常1冻结）
@property (nonatomic , copy) NSString  *tenure_requirements;//
@property (nonatomic , copy) NSString  *position_name;//职位名称
@property (nonatomic , copy) NSString  *post_duties;//
@property (nonatomic , assign) NSInteger resume_num;//投递人数
@property (nonatomic , assign) NSInteger a_two;//二级分类
@property (nonatomic , assign) NSInteger type;//公司类型
@property (nonatomic , assign) NSInteger   bid_price;//竞价
@property (nonatomic , assign) NSInteger   positionId;//职位ID
@property (nonatomic , copy) NSString   *dead_time;//截止时间
@property (nonatomic , copy) NSString   *work_life;//工作时间
@property (nonatomic , copy) NSString   *label;//标签
@property (nonatomic , assign) NSInteger num;//招聘人数
@property (nonatomic , assign) NSInteger look;//浏览人数
@property (nonatomic , assign) NSInteger online_state;//在线状态（0上线1下线）
@property (nonatomic , assign) NSInteger a_one;//一级分类
@property (nonatomic , assign) NSInteger c_id;//用户id
@property (nonatomic , copy) NSString   *area;//工作地区
@property (nonatomic , copy) NSString   *created_time;//创建时间
@property (nonatomic , assign) NSInteger bid_price_state;//是否参与竞价（0否1是）
@property (nonatomic , copy) NSString   *update_time;//更新时间
@property (nonatomic , assign) NSInteger low_money;//最低薪资
@property (nonatomic , assign) NSInteger a_three;//三级分类
@property (nonatomic , copy) NSString   *work_time;//工作时间

@end
