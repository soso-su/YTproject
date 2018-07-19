//
//  YTPageViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPageViewController.h"

@interface YTPageViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)YTPageViewControllerConfiguration *configuration;

@property (nonatomic,copy)NSMutableArray *menuButtons;
@property (nonatomic,copy)NSArray *childViewControllers;
@property (nonatomic,strong)UIButton *currentSelectedButton;

@property (nonatomic,strong)UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIScrollView *menuScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightLayoutConstraint;

@end

@implementation YTPageViewController

+(instancetype)pageWithViewControllers:(NSArray *)viewControllers configuration:(YTPageViewControllerConfiguration *)configuration{
    YTPageViewController *vc = [[YTPageViewController alloc]init];
    vc.childViewControllers = viewControllers;
    
    if (configuration == nil) {
        vc.configuration = [YTPageViewControllerConfiguration defaultConfiguration];
    }else{
        vc.configuration = configuration;
    }
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    [self setupMenu];
    
    [self setupChildViewController];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        UIButton *firstButton = (UIButton *)self.menuButtons.firstObject;
//        CGPoint center = self.indicatorView.center;
//        center.x = firstButton.x + firstButton.width/2;
//        self.indicatorView.center = center;
//    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self setupButtonPosition];
}

#pragma mark =======================EventAction=========================
-(void)buttonDidTap:(UIButton *)sender{
    self.currentSelectedButton.selected = NO;
    self.currentSelectedButton = sender;
    sender.selected = YES;
    
    NSInteger index = [self.menuButtons indexOfObject:sender];
    CGPoint contentOffset = self.contentScrollView.contentOffset;
    contentOffset.x = index * self.contentScrollView.frame.size.width;
    
    [self.contentScrollView setContentOffset:contentOffset animated:YES];
}

#pragma mark =======================UIScrollViewDelegate=========================
/**滑动停止后调用*/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //采用懒加载的方式
    CGFloat x = self.contentScrollView.contentOffset.x;
    CGFloat y = 0;
    CGFloat width = self.contentScrollView.frame.size.width;
    CGFloat height = self.contentScrollView.frame.size.height;
    
    //当前是第几个vc
    NSInteger index = x/width;
    
    //即将要显示的vc
    UIViewController *vcWillShow = self.childViewControllers[index];
    
    //这是顶部滚动标题
    UIButton *indexButton = self.menuButtons[index];
    
    //设置顶部滚动标题
    self.currentSelectedButton.selected = NO;
    self.currentSelectedButton = indexButton;
    indexButton.selected = YES;
    
    //处理左边偏移量
    CGFloat menuWidth = self.menuScrollView.frame.size.width;
    CGFloat buttonCenterX = indexButton.center.x;
    
    CGFloat menuOffsetX = buttonCenterX - menuWidth/2;
    if (menuOffsetX < 0) {
        menuOffsetX = 0;
    }
    
    //处理右边偏移量
    CGFloat maxOffsetX = self.menuScrollView.contentSize.width - menuWidth;
    if (menuOffsetX > maxOffsetX) {
        menuOffsetX = maxOffsetX;
    }
    
    //处理indicatorView
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint center = self.indicatorView.center;
        center.x = indexButton.x + indexButton.width/2;
        self.indicatorView.center = center;
    }];
    
    
    [self.menuScrollView setContentOffset:CGPointMake(menuOffsetX, 0) animated:YES];
    
    //判断即将展现的vc的view是否已经添加到了scrollView中
    if (vcWillShow.view.window != nil && vcWillShow.isViewLoaded) {
        return;
    }
    
    vcWillShow.view.frame = CGRectMake(x, y, width, height);
    
    [self.contentScrollView addSubview:vcWillShow.view];
}

#pragma mark =======================Setup=========================
-(void)setupView{
    self.menuHeightLayoutConstraint.constant = self.configuration.menuHeight;
    
    CGRect frame = CGRectMake(0, 0, 0, 0);
    frame.size = self.configuration.indicatorViewSize;
    frame.origin.y = self.configuration.menuHeight - frame.size.height;
    self.indicatorView = [[UIView alloc]initWithFrame:frame];
    self.indicatorView.backgroundColor = self.configuration.indicatorViewColor;
    [self.menuScrollView addSubview:self.indicatorView];
}

-(void)setupButtonPosition{
    CGFloat margin = self.configuration.menuMargin;
    CGFloat leftOffset = 19;
    CGFloat rightOffest = 19;
    
    //设置每个button的位置
    for (int i = 0; i < self.menuButtons.count; i++) {
        UIButton *button = self.menuButtons[i];
        CGRect frame = button.frame;
        frame.origin.x = leftOffset + margin * i + button.width * i;
        button.frame = frame;
        
        CGPoint center = button.center;
        center.y = self.menuScrollView.size.height/2;
        button.center = center;
        
        if (button == (UIButton *)self.menuButtons.lastObject) {
            self.menuScrollView.contentSize = CGSizeMake(button.frame.origin.x + button.frame.size.width  + rightOffest, 0);
        }
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.frame.size.width, 0);
}

-(void)setupMenu{
    for (UIViewController *vc in self.childViewControllers) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:vc.title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:self.configuration.menuTintFontSize];
        [button setTitleColor:self.configuration.menuTintDefaultColor forState:UIControlStateNormal];
        [button setTitleColor:self.configuration.menuTintSelectedColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonDidTap:) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        [self.menuButtons addObject:button];
        [self.menuScrollView addSubview:button];
    }
    
    [self setupButtonPosition];
}
-(void)setupChildViewController{
    for (UIViewController *vc in self.childViewControllers) {
        [self addChildViewController:vc];
    }
}

#pragma mark =======================Lazy=========================
-(NSMutableArray *)menuButtons
{
    if (!_menuButtons) {
        _menuButtons = [NSMutableArray arrayWithCapacity:self.childViewControllers.count];
    }
    
    return _menuButtons;
}
@end
