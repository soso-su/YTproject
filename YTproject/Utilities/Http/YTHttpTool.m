//
//  YTHttpTool.m
//  YTproject
//
//  Created by suhuahao on 2018/7/10.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTHttpTool.h"

#define YTTIMEOUT  10

static YTHttpTool *_httpTool;

@implementation YTHttpTool

+ (YTHttpTool *)shareYTHttpTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _httpTool = [[YTHttpTool alloc]init];
        _httpTool.afnHttpManager = [AFHTTPSessionManager manager];
        _httpTool.afnHttpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        _httpTool.afnHttpManager.requestSerializer.timeoutInterval = YTTIMEOUT;
    });
    return _httpTool;
}

+ (void)requestWithUrlStr:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer.timeoutInterval = [self getTimeOut];
    [[YTHttpTool shareYTHttpTool].afnHttpManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSTimeInterval)getTimeOut {
    NSTimeInterval timeOut = YTTIMEOUT;
    if (_httpTool.timeOut > 0) {
        timeOut = _httpTool.timeOut;
        _httpTool.timeOut = 0;
    }
    return timeOut;
}

@end
