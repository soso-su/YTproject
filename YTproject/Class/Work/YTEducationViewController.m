//
//  YTEducationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEducationViewController.h"
#import <SGPagingView.h>
#import "YTEducaCollectViewController.h"

@interface YTEducationViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;

@end

@implementation YTEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setPageView];
}
- (IBAction)next:(UIButton *)sender {
}

- (void)setPageView{
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = [UIColor whiteColor];
    configure.indicatorHeight = 2;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width/2, titleViewH) delegate:self titleNames:@[@"语言",@"特色课",@"证书"] configure:configure];
    self.pageTitleView.backgroundColor = [UIColor whiteColor];
    self.pageTitleView.selectedIndex = 0;
    [self.view addSubview:self.pageTitleView];
    
    YTEducaCollectViewController *educationVc = [[YTEducaCollectViewController alloc]init];
    educationVc.type = 0;
    YTEducaCollectViewController *educationVc1 = [[YTEducaCollectViewController alloc]init];
    educationVc1.type = 1;
    YTEducaCollectViewController *educationVc2 = [[YTEducaCollectViewController alloc]init];
    educationVc2.type = 2;
    NSArray *controlArray = @[educationVc,educationVc1,educationVc2];
    CGFloat contentViewHeight = self.view.height - self.pageTitleView.height;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), kScreen_Width, contentViewHeight) parentVC:self childVCs:controlArray];
    self.pageContentView.delegatePageContentScrollView = self;
    
    [self.view addSubview:self.pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

@end
