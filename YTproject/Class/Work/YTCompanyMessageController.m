//
//  YTCompanyMessageController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/10.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCompanyMessageController.h"
#import "TYRotateImageView.h"

@interface YTCompanyMessageController ()<TYRotateImageViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) TYRotateImageView *banner;

@end

@implementation YTCompanyMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRotateView];
}

- (void)setRotateView{
    NSArray *imgArr = @[@"homeBanner",@"gsxqPic2",@"shopBanner"];
    TYRotateImageView *banner = [[TYRotateImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - 30, 125) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
    banner.layer.cornerRadius = 6.0;
    [self.bannerView addSubview:banner];
    self.banner = banner;
}


@end
