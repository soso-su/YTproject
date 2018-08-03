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
@property (nonatomic,assign)BOOL isMenuScrollable;

@property (nonatomic,strong)UIView *indicatorView;
@property (weak, nonatomic) IBOutlet UIScrollView *menuScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightLayoutConstraint;

@end

@implementation YTPageViewController

#pragma mark =======================PublicMethod=========================
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

- (void)selectViewController:(NSInteger)index{
    if (index >= self.menuButtons.count){
#if DEBUG
        [NSException raise:@"数组越界" format:@"选择的控制器超过了总控制器的数量"];
#endif
        return;
    }
    
    [self buttonDidTap:self.menuButtons[index]];
}


#pragma mark =======================LifeCycle=========================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    [self setupMenu];
    
    [self setupChildViewController];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
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
    
    if (self.isMenuScrollable){
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
        
        [self.menuScrollView setContentOffset:CGPointMake(menuOffsetX, 0) animated:YES];
    }
    
    //处理indicatorView
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint center = self.indicatorView.center;
        center.x = indexButton.x + indexButton.width/2;
        self.indicatorView.center = center;
    }];
    
    if ([self.delegate respondsToSelector:@selector(didScrollToViewController:index:)]) {
        [self.delegate didScrollToViewController:vcWillShow index:index];
    }
    
    
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
    CGFloat buttonWidth = 0;
    
    for (UIButton *button in self.menuButtons) {
        //取最大的button的宽度作为通用的宽度
        buttonWidth = MAX(buttonWidth, button.width);
    }
    
    //设置每个button的位置
    for (int i = 0; i < self.menuButtons.count; i++) {
        UIButton *button = self.menuButtons[i];
        button.width = buttonWidth;
        button.centerY = self.menuScrollView.size.height/2;
        button.x = leftOffset + margin * i + buttonWidth * i;
        
        //判断最后一个button有没有超过屏幕宽度，没有的话则顶部不可滚动
        if (button == (UIButton *)self.menuButtons.lastObject) {
            self.menuScrollView.contentSize = CGSizeMake(button.frame.origin.x + button.frame.size.width  + rightOffest, 0);
            
            if (self.menuScrollView.contentSize.width < self.view.width){
                //button没有占满
                [self setupButtonPositionForUnscrollabelMenu];
                self.isMenuScrollable = NO;
            }else{
                self.isMenuScrollable = YES;
            }
        }
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.frame.size.width, 0);
}

//配置menu为不可滚动，此时configuration中的margin属性无效
-(void)setupButtonPositionForUnscrollabelMenu{
    
    CGFloat buttonWidth = 0;
    
    for (UIButton *button in self.menuButtons) {
        buttonWidth = MAX(buttonWidth, button.width);
    }
    
    //计算每个button之间的间隔
    CGFloat margin = (self.configuration.menuWidth - buttonWidth * self.menuButtons.count)/(self.menuButtons.count + 1);
    
    for (int i = 0; i < self.menuButtons.count; i++) {
        UIButton *button = self.menuButtons[i];
        button.width = buttonWidth;
        button.x = margin + margin * i + button.width * i;
//        button.backgroundColor = UIColor.yellowColor;
    }
    
    self.menuScrollView.width = self.configuration.menuWidth;
    
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
