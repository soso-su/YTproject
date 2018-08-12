//
//  YTCommitVCRViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCommitVCRViewController.h"
#import "YTResumeViewController.h"
#import "FMFVideoView.h"
#import <AVFoundation/AVFoundation.h>
#import "YTUploadImage.h"

@interface YTCommitVCRViewController ()<FMFVideoViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addVCRButton;
@property (nonatomic, strong) FMFVideoView *videoView;
@property (nonatomic, strong) AVPlayer *player;
@property (weak, nonatomic) IBOutlet UIView *videoBgView;
@property (nonatomic ,strong) NSURL *videoUrl;

@end

@implementation YTCommitVCRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [[YTTool getWindow] addSubview:self.videoView];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_videoView.fmodel.recordState == FMRecordStateFinish) {
        [_videoView reset];
    }
    
}

- (void)setNav{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (FMFVideoView *)videoView{
    if (!_videoView) {
        _videoView = [[FMFVideoView alloc] initWithFMVideoViewType:TypeFullScreen];
        _videoView.delegate = self;
        _videoView.hidden = YES;
    }
    return _videoView;
}

- (IBAction)clickVCR:(UIButton *)sender {
    if (_videoView.fmodel.recordState == FMRecordStateFinish) {
        [_videoView reset];
    }
    self.videoView.hidden = NO;
}


- (IBAction)commit:(UIButton *)sender {
    [self postVideo];
//    for (UIViewController *vc in self.navigationController.viewControllers) {
//        if ([vc isKindOfClass:[YTResumeViewController class]]) {
//            [self.navigationController popToViewController:vc animated:YES];
//        }
//    }
}

- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - FMFVideoViewDelegate
- (void)dismissVC
{
    self.videoView.hidden = YES;
}

- (void)recordFinishWithvideoUrl:(NSURL *)videoUrl
{
//    NSData *data = [NSData dataWithContentsOfURL:videoUrl];
    YTLog(@"video = %@",videoUrl);
    self.videoUrl = videoUrl;
    self.videoView.hidden = YES;
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:videoUrl];
    self.player = [AVPlayer playerWithPlayerItem:item];
    AVPlayerLayer *showVodioLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    showVodioLayer.frame = self.videoBgView.bounds;
    [self.videoBgView.layer addSublayer:showVodioLayer];
    [self.player play];
}


#pragma mark ----------------Http-------------------------

- (void)postVideo{
    NSData *data = [NSData dataWithContentsOfURL:self.videoUrl];
    [YTUploadImage uploadFile:data fileName:@"vcr" parameters:nil uploadType:uploadType_video success:^(id responseObject) {
        YTLog(@"responseObject = %@",responseObject);
    } failure:^(NSError *error) {
        YTLog(@"error = %@",error);
    }];
}


@end
