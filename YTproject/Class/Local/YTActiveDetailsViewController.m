//
//  YTActiveDetailsViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/13.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTActiveDetailsViewController.h"
#import "TYRotateImageView.h"
#import "ReviewViewController.h"
#import "ShareView.h"

@interface YTActiveDetailsViewController ()<TYRotateImageViewDelegate,ShareViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *imgScrollView;
@property (weak, nonatomic) TYRotateImageView *banner;
@property (weak, nonatomic) IBOutlet UIView *vedioView;
@property (strong, nonatomic)ShareView *shareView;
@end

@implementation YTActiveDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[YTTool getWindow] addSubview:self.shareView];
    [self setRotateView];
}

- (void)setRotateView{
    NSArray *imgArr = @[@"activityPic",@"activityPic",@"activityPic"];
    TYRotateImageView *banner = [[TYRotateImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - 30, 146) style:ImageScrollType_Banner images:imgArr confirmBtnTitle:nil confirmBtnTitleColor:nil confirmBtnFrame:CGRectNull autoScrollTimeInterval:3.0 delegate:self];
    banner.layer.cornerRadius = 6.0;
    banner.pageColor = [UIColor grayColor];
    banner.pageCurrentColor = [UIColor whiteColor];
    [self.imgScrollView addSubview:banner];
    self.banner = banner;
}


- (IBAction)share:(UIButton *)sender {
    self.shareView.hidden = NO;
}
- (IBAction)relation:(UIButton *)sender {
    
}
- (IBAction)review:(UIButton *)sender {
    ReviewViewController *review = [[ReviewViewController alloc]init];
    [self.navigationController pushViewController:review animated:YES];
}
- (IBAction)collect:(UIButton *)sender {
}
- (IBAction)likenum:(UIButton *)sender {
}

- (void)clickCloseBtn{
    self.shareView.hidden = YES;
}

- (ShareView *)shareView{
    if (!_shareView) {
        _shareView = [[ShareView alloc]init];
        _shareView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _shareView.backgroundColor = [UIColor colorWithWhite:50.0/255.0 alpha:0.5];
        _shareView.hidden = YES;
        _shareView.delegate = self;
    }
    return _shareView;
}

@end
