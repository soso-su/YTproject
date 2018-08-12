//
//  YTUploadImage.h
//  YTproject
//
//  Created by suhuahao on 2018/8/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTHttpTool.h"

typedef NS_ENUM(NSInteger,uploadType) {
    uploadType_image = 0,
    uploadType_video
};

@interface YTUploadImage : NSObject

+ (void)uploadFile:(NSData *)fileData
          fileName:(NSString *)fileName
        parameters:(id)parameters
        uploadType:(uploadType)type
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;;

@end
