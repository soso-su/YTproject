//
//  YTUploadImage.m
//  YTproject
//
//  Created by suhuahao on 2018/8/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTUploadImage.h"
#import <AVFoundation/AVFoundation.h>


@implementation YTUploadImage

+ (void)uploadFile:(NSData *)fileData fileName:(NSString *)fileName parameters:(id)parameters uploadType:(uploadType)type{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    [manager.requestSerializer setValue:[YTUserModel share].token forHTTPHeaderField:@"token"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/plain",
                                                         @"text/javascript",
                                                         @"text/json",
                                                         @"text/html",
                                                         @"image/jpeg", nil];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURLSessionDataTask *uploadTask = [manager POST:YTUploadImageUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString *typeName, *mimeType, *fileName;
        if (type==uploadType_image) {
            typeName = @"image";
            mimeType = @"image/*";
            fileName = @"fileName.jpg";
        }else if (type==uploadType_video) {
            typeName = @"video";
            mimeType = @"video/*";
            fileName = @"fileName.mp4";
        }
        [formData appendPartWithFileData:fileData name:typeName fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        YTLog(@"%lld--%lld",uploadProgress.totalUnitCount, uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        YTLog(@"成功:%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        YTLog(@"失败:%@",error);
    }];
    [uploadTask resume];
}

// 视频转换为MP4
+(NSURL *)convertToMp4:(NSURL *)movUrl
{
    NSURL *mp4Url = nil;
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:movUrl options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetHighestQuality]) {
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset
                                                                              presetName:AVAssetExportPresetHighestQuality];
        NSString *mp4Path = [NSString stringWithFormat:@"%@/%d%d.mp4", [self dataPath], (int)[[NSDate date] timeIntervalSince1970], arc4random() % 100000];
        mp4Url = [NSURL fileURLWithPath:mp4Path];
        exportSession.outputURL = mp4Url;
        exportSession.shouldOptimizeForNetworkUse = YES;
        exportSession.outputFileType = AVFileTypeMPEG4;
        dispatch_semaphore_t wait = dispatch_semaphore_create(0l);
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed: {
                    NSLog(@"failed, error:%@.", exportSession.error);
                } break;
                case AVAssetExportSessionStatusCancelled: {
                    NSLog(@"cancelled.");
                } break;
                case AVAssetExportSessionStatusCompleted: {
                    NSLog(@"completed.");
                } break;
                default: {
                    NSLog(@"others.");
                } break;
            }
            dispatch_semaphore_signal(wait);
        }];
        long timeout = dispatch_semaphore_wait(wait, DISPATCH_TIME_FOREVER);
        if (timeout) {
            NSLog(@"timeout.");
        }
        if (wait) {
            //dispatch_release(wait);
            wait = nil;
        }
    }
    return mp4Url;
}

+ (NSString*)dataPath
{
    NSString *dataPath = [NSString stringWithFormat:@"%@/Library/appdata/chatbuffer", NSHomeDirectory()];
    NSFileManager *fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:dataPath]){
        [fm createDirectoryAtPath:dataPath
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
    }
    return dataPath;
}


@end
