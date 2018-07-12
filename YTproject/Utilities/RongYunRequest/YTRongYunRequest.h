//
//  YTRongYunRequest.h
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTRongYunRequest : NSObject

+(void)getTokenWithDict:(NSDictionary *)dict success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

@end
