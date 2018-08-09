//
//  YTWorkTypeModel.m
//  YTproject
//
//  Created by suhuahao on 2018/8/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkTypeModel.h"

@implementation YTWorkTypeModel

@end

@implementation AssortmentList

+(NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"assort_id" : @"id"};
}

+(NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"level2":[Level2 class]};
}

@end

@implementation Level2

+(NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"level2_id" : @"id"};
}

+(NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"level3":[Level3 class]};
}

@end

@implementation Level3

+(NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"level3_id" : @"id"};
}

@end
