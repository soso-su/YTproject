//
//  YTCompanyViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCompanyViewController.h"
#import "CustomButton.h"
#import "YTTouchView.h"
#import <SGPagingView.h>
#import "YTCompanyMessageController.h"
#import "YTWorkSearchTableViewController.h"

@interface YTCompanyViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>

//@property (nonatomic, weak)UIScrollView *scrollView;
//
//@property (nonatomic, weak)UIView *bgView;

@property (nonatomic, weak)UIImageView *companyLogo;

@property (nonatomic, weak)UILabel *companyName;

@property (nonatomic, weak)UILabel *companyCount;

@property (nonatomic, weak)CustomButton *companyAddress;

@property (nonatomic, weak)YTTouchView *attestationView;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;

@end

@implementation YTCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    CGFloat left = 15;
    CGFloat top = 12;
    CGFloat logoH = 62;
    CGFloat headH = 176;
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    self.title = @"公司详情";
    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, self.view.height)];
//    [self.view addSubview:scrollView];
//    self.scrollView = scrollView;
//    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, self.view.height)];
//    [scrollView addSubview:bgView];
//    self.bgView = bgView;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, headH)];
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    
    UIImageView *companyLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gsxqPic1"]];
    companyLogo.frame = CGRectMake(left, top, logoH, logoH);
    [headView addSubview:companyLogo];
    self.companyLogo = companyLogo;
    
    UILabel *companyName = [[UILabel alloc]init];
    companyName.text = @"马蜂窝";
    companyName.textColor = RGB(51, 51, 51);
    companyName.font = [UIFont systemFontOfSize:14.0];
    [companyName sizeToFit];
    companyName.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+top, top, companyName.width, companyName.height);
    [headView addSubview:companyName];
    self.companyName = companyName;
    
    UILabel *companyCount = [[UILabel alloc]init];
    companyCount.textColor = RGB(102, 102, 102);
    companyCount.font = [UIFont systemFontOfSize:11.0];
    companyCount.text = @"1000-2000人   互联网";
    [companyCount sizeToFit];
    companyCount.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+top, CGRectGetMaxY(companyName.frame)+indicatorWidth, companyCount.width, companyCount.height);
    [headView addSubview:companyCount];
    self.companyCount = companyCount;
    
    CustomButton *companyAddress = [CustomButton buttonWithType:UIButtonTypeCustom];
    companyAddress.customButtonType = 1;
    [companyAddress setTitle:@"广州" forState:UIControlStateNormal];
    [companyAddress setImage:[UIImage imageNamed:@"gsxqIconLocation"] forState:UIControlStateNormal];
    [companyAddress setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
    companyAddress.titleLabel.font = [UIFont systemFontOfSize:11.0];
    [companyAddress sizeToFit];
    companyAddress.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+5, CGRectGetMaxY(companyCount.frame)+indicatorWidth, companyAddress.width+15, companyAddress.height);
    [headView addSubview:companyAddress];
    self.companyAddress = companyAddress;
    
    YTTouchView *attestationView = [[YTTouchView alloc]initWithFrame:CGRectMake(left, CGRectGetMaxY(companyLogo.frame)+28, logoH, logoH)];
    UIImageView *attestationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gsxqIcon1"]];
    attestationImage.frame = CGRectMake(left, 0, 36, 36);
    [attestationView addSubview:attestationImage];
    
    UILabel *attestationTitle = [[UILabel alloc]init];
    attestationTitle.text = @"企业认证";
    attestationTitle.font = [UIFont systemFontOfSize:11];
    attestationTitle.textColor = RGB(102, 102, 102);
    [attestationTitle sizeToFit];
    attestationTitle.frame = CGRectMake(0, CGRectGetMaxY(attestationImage.frame)+indicatorWidth, attestationTitle.width, attestationTitle.height);
    attestationTitle.centerX = attestationImage.centerX;
    [attestationView addSubview:attestationTitle];
    [headView addSubview:attestationView];
    
    
    UIView *underView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headView.frame)+indicatorWidth, kScreen_Width, self.view.height - headView.height - indicatorWidth)];
    underView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:underView];
    
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = DefaultColor;
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width, titleViewH) delegate:self titleNames:@[@"基本信息",@"招聘职位"] configure:configure];
    self.pageTitleView.selectedIndex = 0;
    [underView addSubview:self.pageTitleView];
    
    YTCompanyMessageController *messageVc = [[YTCompanyMessageController alloc]init];
    YTWorkSearchTableViewController *tableVc = [[YTWorkSearchTableViewController alloc]init];
    tableVc.type = 100;
    NSArray *vcs = @[messageVc,tableVc];
    
    CGFloat contentViewHeight = kScreen_Height - headH - indicatorWidth - titleViewH - self.stateBarAndNavBarHeight;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, titleViewH, kScreen_Width, contentViewHeight) parentVC:self childVCs:vcs];
    self.pageContentView.delegatePageContentScrollView = self;
    [underView addSubview:self.pageContentView];
    
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
