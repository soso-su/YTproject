//
//  YTHttpTool.h
//  YTproject
//
//  Created by suhuahao on 2018/7/10.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

typedef NS_ENUM(NSInteger,RequestType){
    RequestType_post = 0,
    RequestType_get = 1
};

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface YTHttpTool : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *afnHttpManager;
@property (assign , nonatomic) NSTimeInterval timeOut;

+ (YTHttpTool *)shareYTHttpTool;

+ (void)requestWithUrlStr:(NSString *)URLString
              requestType:(RequestType)type
               parameters:(id)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

@end
