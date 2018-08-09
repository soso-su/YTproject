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
    
    NSMutableArray *titleArray = [NSMutableArray array];
    NSMutableArray *vcArray = [NSMutableArray array];
    for (int i = 0; i < self.list.count; i++) {
        Level2 *model = self.list[i];
        [titleArray addObject:model.assort_name];
        YTEducaCollectViewController *educationVc = [[YTEducaCollectViewController alloc]init];
        educationVc.type = i;
        [vcArray addObject:educationVc];
    }
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width/2, titleViewH) delegate:self titleNames:titleArray configure:configure];
    self.pageTitleView.backgroundColor = [UIColor whiteColor];
    self.pageTitleView.selectedIndex = 0;
    [self.view addSubview:self.pageTitleView];
    
    CGFloat contentViewHeight = self.view.height - self.pageTitleView.height;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), kScreen_Width, contentViewHeight) parentVC:self childVCs:vcArray];
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
