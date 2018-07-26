//
//  YTCameraViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCameraViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface YTCameraViewController ()<UITextViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *photos;
@property (nonatomic ,strong) NSMutableArray *nameArray;
@property (nonatomic ,strong) NSMutableArray *posterImageArray;
@end

@implementation YTCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getPhotos];
}

- (void)getPhotos{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [self noticeAlerPhotos];
    }else{
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                
                PHFetchOptions *option = [[PHFetchOptions alloc] init];
                //排序方式
                option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:NO]];
                // 列出所有相册智能相册
                PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
                /* 列出所有用户创建的相册
                 PHFetchResult *topLevelUserCollections = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
                 */
                
                /*
                 获取所有资源的集合，并按资源的创建时间排序
                 PHFetchOptions *options = [[PHFetchOptions alloc] init];
                 options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
                 PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
                 */
                
                for (NSInteger i = 0; i < smartAlbums.count; i++) {
                    // 获取一个相册（PHAssetCollection）
                    PHCollection *collection = smartAlbums[i];
                    if ([collection isKindOfClass:[PHAssetCollection class]]) {
                        PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
                        // 从每一个智能相册中获取到的 PHFetchResult 中包含的才是真正的资源（PHAsset）
                        PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
                        
                        if (fetchResult.count > 0) {
                            
                            [self.photos addObject:fetchResult];
                            
                            [self.nameArray addObject:assetCollection.localizedTitle];
                            
                            /*
                             获取封面图片,就是第一张图片
                             默认的是异步加载,这里选择了同步 因为只获取一张照片，不会对界面产生很大的影响
                             如果targetSize:PHImageManagerMaximumSize 则默认的返回原图,耗费很大的性能
                             */
                            PHAsset *asset = (PHAsset *)fetchResult.firstObject;
                            PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
                            options.synchronous = YES;
                            [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info)
                             {
                                 [self.posterImageArray addObject:result];
                                 YTLog(@"self.posterImageArray ==== %@",self.posterImageArray);
                             }];
                        }
                    }else {
                        
                        NSAssert(NO, @"Fetch collection not PHCollection: %@", collection);
                    }
                }
                //在主线程更新UI界面
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"_cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"_cell"];
    }
    cell.textLabel.text = self.nameArray[indexPath.row];
    return cell;
}

- (void)noticeAlerPhotos{
    NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
    NSString *alerString = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问你的手机相册", appName];
    // 展示提示语
    dispatch_async(dispatch_get_main_queue(), ^{
        
        YTLog(@"%@",alerString);
        
    });
}

- (NSMutableArray *)photos{
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

- (NSMutableArray *)posterImageArray{
    if (!_posterImageArray) {
        _posterImageArray = [NSMutableArray array];
    }
    return _posterImageArray;
}

- (NSMutableArray *)nameArray{
    if (!_nameArray) {
        _nameArray = [NSMutableArray array];
    }
    return _nameArray;
}

@end
