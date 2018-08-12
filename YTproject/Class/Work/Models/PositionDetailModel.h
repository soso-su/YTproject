//
//  PositionDetailModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/1.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionDetailModel : NSObject

@property (nonatomic , copy) NSString  *update_time;//更新时间
@property (nonatomic , assign) NSInteger  resume_num;//投递人数
@property (nonatomic , assign) NSInteger  a_one;//
@property (nonatomic , copy) NSString  *positionId;//职位ID
@property (nonatomic , copy) NSString  *education;//学历
@property (nonatomic , assign) NSInteger  a_three;//
@property (nonatomic , copy) NSString  *abbreviation;//公司简称
@property (nonatomic , assign) NSInteger  c_id;//用户id
@property (nonatomic , copy) NSString  *address;//公司地址
@property (nonatomic , copy) NSString  *verify;//核实
@property (nonatomic , copy) NSString  *label;//标签
@property (nonatomic , assign) NSInteger  num;//招聘人数
@property (nonatomic , copy) NSString  *work_time;//工作时间
@property (nonatomic , assign) NSInteger  position_state;//职位状态（0正常1冻结）
@property (nonatomic , assign) NSInteger  type;//公司类型
@property (nonatomic , copy) NSString  *number;//公司员工人数
@property (nonatomic , assign) NSInteger  bid_price_state;//是否参与竞价（0否1是）
@property (nonatomic , assign) NSInteger  look;//浏览人数
@property (nonatomic , copy) NSString     *avatar_url;//公司头像
@property (nonatomic , assign) NSInteger  company_type;//类型（0全职1兼职2实习3英途认证4可提供工签）
@property (nonatomic , copy) NSString     *area;//工作地区
@property (nonatomic , copy) NSString     *post_duties;
@property (nonatomic , assign) NSInteger  bid_price;//竞价
@property (nonatomic , assign) NSInteger  work_life;//工作年限
@property (nonatomic , copy) NSString     *dead_time;//截止时间
@property (nonatomic , assign) NSInteger  hight_money;//
@property (nonatomic , copy) NSString     *financing;
@property (nonatomic , assign) NSInteger  low_money;//
@property (nonatomic , copy) NSString     *created_time;
@property (nonatomic , copy) NSString     *position_name;//职位名称
@property (nonatomic , assign) NSInteger  a_two;
@property (nonatomic , copy) NSString     *language;//语言
@property (nonatomic , copy) NSString     *company_label;//公司标签
@property (nonatomic , assign) NSInteger  online_state;//在线状态（0上线1下线）
@property (nonatomic , copy) NSString     *tenure_requirements;

//职位简介
@property (nonatomic, strong) NSString *position_introduce;


@end
