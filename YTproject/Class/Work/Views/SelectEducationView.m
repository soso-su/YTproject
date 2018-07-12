//
//  SelectEducationView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "SelectEducationView.h"
#import "YTEducationViewController.h"
#import "YTEducaCollectViewController.h"
#import <SGPagingView.h>

@interface SelectEducationView()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;

@end

@implementation SelectEducationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setController:(UIViewController *)controller{
    _controller = controller;
    [self setUpUI];
}

- (void)setUpUI{
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = DefaultColor;
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width/2, titleViewH) delegate:self titleNames:@[@"教育",@"非教育"] configure:configure];
    self.pageTitleView.backgroundColor = RGB(238, 238, 238);
    self.pageTitleView.selectedIndex = 0;
    [self addSubview:self.pageTitleView];
    
    YTEducationViewController *educationVc = [[YTEducationViewController alloc]init];
    YTEducaCollectViewController *educationVc1 = [[YTEducaCollectViewController alloc]init];
    educationVc1.type = 100;
    NSArray *controlArray = @[educationVc,educationVc1];
    CGFloat contentViewHeight = self.height - self.pageTitleView.height;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), kScreen_Width, contentViewHeight) parentVC:self.controller childVCs:controlArray];
    self.pageContentView.delegatePageContentScrollView = self;
    
    [self addSubview:self.pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

@end
