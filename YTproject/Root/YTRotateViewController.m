//
//  YTRotateViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTRotateViewController.h"
#import "TYRotateImageView.h"
#import "AppDelegate.h"
#import "YTTabBarViewController.h"


@interface YTRotateViewController ()<TYRotateImageViewDelegate>

@end

@implementation YTRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRotateView];
}

- (void)setRotateView{
    
    NSArray *imgArr = @[@"viewpager",@"viewpager",@"viewpager"];
    TYRotateImageView *imgScrView  = [[TYRotateImageView alloc]initWithFrame:CGRectNull style:ImageScrollType_Guide images:imgArr confirmBtnTitle:@"立即体验" confirmBtnTitleColor:[UIColor whiteColor] confirmBtnFrame:CGRectMake(kScreen_Width/2 - 60, kScreen_Height - 210, 100, 40) autoScrollTimeInterval:0 delegate:self];
    imgScrView.pageColor = [UIColor grayColor];
    imgScrView.pageCurrentColor = DefaultColor;
    [self.view addSubview:imgScrView];
    [imgScrView addPageControlToSuperView:self.view];

    
//    NSArray *imgArr = @[@"tabbarWorkPre",@"tabbarLocalPre",@"tabbarLocalPre",@"tabbarShopPre"];
//    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
//    TYRotateImageView *imgScrView = [[TYRotateImageView alloc]initWithFrame:CGRectMake(10, 100, scrW-20, 250) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
    
//    [self.view addSubview:imgScrView];
//    [imgScrView addPageControlToSuperView:self.view];
//    //使用Scrollview与Navigation使用会出现坐标位置不齐,所以使用以下方法可调整
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)experienceDidHandle{
    //1)切换窗口的根视图控制器
    YTTabBarViewController *vc = [[YTTabBarViewController alloc]init];
    [YTTool getWindow].rootViewController = vc;
    [[YTTool getWindow] makeKeyAndVisible];
}


- (void)bannerImageDidHandleWithIndex:(NSInteger)index
{
    YTLog(@"===%ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
