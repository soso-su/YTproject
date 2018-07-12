//
//  YTRongYunRequest.m
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRongYunRequest.h"

@implementation YTRongYunRequest

+ (void)getTokenWithDict:(NSDictionary *)dict success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer.timeoutInterval = 10;
    NSString * timestamp = [[NSString alloc] initWithFormat:@"%ld",(NSInteger)[NSDate timeIntervalSinceReferenceDate]];
    NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
    NSString * appkey = YTRongYun_AppKey;
    NSString * Signature = [NSString stringWithFormat:@"%@%@%@",appkey,nonce,timestamp];
    [[YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer setValue:appkey forHTTPHeaderField:@"App-Key"];
    [[YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
    [[YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer setValue:timestamp forHTTPHeaderField:@"Timestamp"];
    [[YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer setValue:Signature forHTTPHeaderField:@"Signature"];
    [[YTHttpTool shareYTHttpTool].afnHttpManager.requestSerializer setValue:YTRongYun_AppSecret forHTTPHeaderField:@"appSecret"];
    [[YTHttpTool shareYTHttpTool].afnHttpManager POST:YTGetRongYunTokenUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
