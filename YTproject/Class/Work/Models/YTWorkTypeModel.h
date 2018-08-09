//
//  YTWorkTypeModel.h
//  YTproject
//
//  Created by suhuahao on 2018/8/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AssortmentList;
@interface YTWorkTypeModel : NSObject

@property (nonatomic , strong) NSArray<AssortmentList *>  *assortmentList;

@end


@class Level2;
@interface AssortmentList : NSObject

//上级分类
@property (nonatomic, assign) NSInteger parent_assort;

//服务图片
@property (nonatomic, strong) NSString *img;

//分类级别（0一级1二级2三级）
@property (nonatomic, assign) NSInteger assort_level;

//分类名称
@property (nonatomic, strong) NSString *assort_name;

//id
@property (nonatomic, assign) NSInteger assort_id;

//分类类型（0服务分类1商品分类2行业分类）
@property (nonatomic, assign) NSInteger type;

@property (nonatomic , strong) NSArray<Level2 *>    *level2;

@end

@class Level3;
@interface Level2 :NSObject
@property (nonatomic , strong) NSArray<Level3 *>              * level3;
@property (nonatomic , copy) NSString              * img;
@property (nonatomic , copy) NSString              * spec_two;
@property (nonatomic , assign) NSInteger              level2_id;
@property (nonatomic , copy) NSString              * spec_one;
@property (nonatomic , assign) NSInteger              parent_assort;
@property (nonatomic , assign) NSInteger              assort_level;
@property (nonatomic , assign) NSInteger              type;
@property (nonatomic , copy) NSString              * assort_name;
@property (nonatomic , copy) NSString              * created_time;

@end

@interface Level3 :NSObject
@property (nonatomic , copy) NSString              * spec_two;
@property (nonatomic , copy) NSString              * img;
@property (nonatomic , assign) NSInteger              level3_id;
@property (nonatomic , copy) NSString              * spec_one;
@property (nonatomic , assign) NSInteger              parent_assort;
@property (nonatomic , assign) NSInteger              assort_level;
@property (nonatomic , assign) NSInteger              type;
@property (nonatomic , copy) NSString              * assort_name;
@property (nonatomic , copy) NSString              * created_time;

@end
