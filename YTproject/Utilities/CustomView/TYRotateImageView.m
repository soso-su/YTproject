//
//  TYRotateImageView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "TYRotateImageView.h"

#define  SCR_W  [UIScreen mainScreen].bounds.size.width    // 屏幕宽度
#define  SCR_H  [UIScreen mainScreen].bounds.size.height

#define  FIT_X(x)  (SCR_W/375.*(x))     // 用于x轴适配
#define  FIT_Y(y)  (SCR_H/667.*(y))     // 用于y轴适配
@interface TYRotateImageView()
{
    ImageScrollType _type;  // 样式
    NSString *_confirmBtnTitle; // 确认按钮标题
    CGRect _confirmBtnFrame; // 确认按钮位置
    UIColor *_confirmBtnTitleColor; // 确认按钮标题颜色
    NSUInteger _imgCount; // 图片个数
    CGFloat _disX; //在X轴的移动距离
}
@property(nonatomic,assign)id<TYRotateImageViewDelegate>scDelegate;
@property(nonatomic,strong)NSTimer *myTimer;  // 定时器
@property(nonatomic,strong)UIPageControl *pageCtl; // 分页控件

@end

@implementation TYRotateImageView



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (self.type == ImageScrollType_Guide) {
            // 设置内容视图大小
            self.contentSize = CGSizeMake(frame.size.width * self.imageNameArr.count, frame.size.height);
        }else{
            // 设置内容视图大小
            self.contentSize = CGSizeMake(frame.size.width * (self.imageNameArr.count+2), frame.size.height);
        }
        
        // 样式赋值
        _type = self.type;
        // 图片数量赋值
        _imgCount = self.imageNameArr.count;
        
        // guide样式固定大小
        if (self.type == ImageScrollType_Guide) {
            self.frame = CGRectMake(0, 0, SCR_W, SCR_H);
            self.contentSize = CGSizeMake(SCR_W * self.imageNameArr.count, SCR_H);
            
            _confirmBtnTitle = self.title;
            _confirmBtnFrame = self.btnFrame;
            _confirmBtnTitleColor = self.titleColor;
        }
        // 隐藏滚动条
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        // 开启分页属性
        self.pagingEnabled = YES;
        // 设置UIScrollView代理
        self.delegate = self;
        // 设置自定义的代理
        self.scDelegate = self.rotateDelegate;
        // 添加图片子视图
        [self addImageSubViews:self.imageNameArr];
        
        if(self.type == ImageScrollType_Banner) {
            self.myTimer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(timerDidHandle:) userInfo:nil repeats:YES];
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(ImageScrollType)type images:(NSArray *)imgNameArr confirmBtnTitle:(NSString *)title confirmBtnTitleColor:(UIColor *)titleColor confirmBtnFrame:(CGRect)btnFrame autoScrollTimeInterval:(NSTimeInterval)interval delegate:(id<TYRotateImageViewDelegate>)delegate{
    self = [super initWithFrame:frame];
    if (self) {
        if (type == ImageScrollType_Guide)
        {
            // 设置内容视图大小
            self.contentSize = CGSizeMake(frame.size.width * imgNameArr.count, frame.size.height);
        }
        else
        {
            // 设置内容视图大小
            self.contentSize = CGSizeMake(frame.size.width * (imgNameArr.count+2), frame.size.height);
        }
        
        
        
        // 样式赋值
        _type = type;
        // 图片数量赋值
        _imgCount = imgNameArr.count;
        // guide样式固定大小
        if (type == ImageScrollType_Guide) {
            self.frame = CGRectMake(0, 0, SCR_W, SCR_H);
            self.contentSize = CGSizeMake(SCR_W * imgNameArr.count, SCR_H);
            
            _confirmBtnTitle = title;
            _confirmBtnFrame = btnFrame;
            _confirmBtnTitleColor = titleColor;
        }
        // 隐藏滚动条
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        // 开启分页属性
        self.pagingEnabled = YES;
        // 设置UIScrollView代理
        self.delegate = self;
        // 设置自定义的代理
        self.scDelegate = delegate;
        // 添加图片子视图
        [self addImageSubViews:imgNameArr];
        // 添加定时器
        if(type == ImageScrollType_Banner) {
            self.myTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerDidHandle:) userInfo:nil repeats:YES];
        }
        
        
    }
    return self;
}

/// 添加分页控件方法
-(void)addPageControlToSuperView:(UIView *)superView {
    self.pageCtl.centerX = superView.width/2;
    [superView addSubview:self.pageCtl];
}



#pragma mark - 分页控制器实例化getter重写
/// 添加分页子视图
-(UIPageControl *)pageCtl{
    if (!_pageCtl) {
        _pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, FIT_X(300), FIT_Y(25))];
        if (_type == ImageScrollType_Guide)
        {
            _pageCtl.center = CGPointMake(kScreen_Width/2, SCR_H-FIT_Y(20));
            
        }
        
        else{
            _pageCtl.center = CGPointMake(self.frame.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height-FIT_Y(25));
        }
        _pageCtl.pageIndicatorTintColor = [UIColor grayColor];
        _pageCtl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageCtl.hidesForSinglePage = YES;
        _pageCtl.numberOfPages = _imgCount;
        _pageCtl.currentPage = 0;
    }
    return _pageCtl;
}


/// 添加图片子视图
-(void)addImageSubViews:(NSArray *)imgNameArr {
    
    if (_type == ImageScrollType_Guide)
    {
        for (int i = 0; i<imgNameArr.count; i++) {
            // 实例化图形视图
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0 + i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            // 添加为滚动视图的子视图
            [self addSubview:imgView];
            // 设置图形视图的图片
            imgView.image = [UIImage imageNamed:imgNameArr[i]];
            
            // 最后一个图形视图
            if(i==imgNameArr.count-1){
                imgView.userInteractionEnabled = YES;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = _confirmBtnFrame;
                [btn setTitle:_confirmBtnTitle forState:UIControlStateNormal];
                [btn setTitleColor:_confirmBtnTitleColor forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(confirmBtnDidHandle:) forControlEvents:UIControlEventTouchUpInside];
                [imgView addSubview:btn];
            }
            
        }
        
    }
    //banner样式
    else
    {
        for (int i = 0; i < imgNameArr.count+2; i++)
        {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
            //添加self的子视图
            [self addSubview:imgView];
            if (i == 0) // 第一个图片子视图加载的是图片数组中最后一张图片
            {
                imgView.image = [UIImage imageNamed:imgNameArr[imgNameArr.count-1]];
                imgView.tag = imgNameArr.count-1;
            }
            else if (i == imgNameArr.count +1)// 最后一个图片子视图加载的是图片数组的第一张
            {
                imgView.image = [UIImage imageNamed:imgNameArr[0]];
                imgView.tag = 0;
            }
            else  // 中间图片子视图的图片设置
            {
                imgView.image = [UIImage imageNamed:imgNameArr[i-1]];
                imgView.tag = i-1;
            }
            imgView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDidHandle:)];
            [imgView addGestureRecognizer:tap];
            //设定_disX的初始值
            _disX = self.frame.size.width;
            //设置子视图的开始滚动位置
            [self setContentOffset:CGPointMake(_disX, 0) animated:YES];
        }
    }
}

#pragma mark - 触发方法
// 定时器触发的方法
-(void)timerDidHandle:(NSTimer *)t {
    _disX += self.frame.size.width;
    
    [self scrollRectToVisible:CGRectMake(_disX, self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
    
    
}

/// guide最后视图上的“立即体验”按钮触发
-(void)confirmBtnDidHandle:(UIButton *)btn {
    if ([self.scDelegate respondsToSelector:@selector(experienceDidHandle)]) {
        [self.scDelegate experienceDidHandle];
    }
}

/// banner图片点击后触发
-(void)tapDidHandle:(UITapGestureRecognizer *)tap {
    // 获取触发了该点击手势的视图对象
    UIView *tapView = tap.view;
    
    if (![tapView isKindOfClass:[UIImageView class]]) {
        return;
    }
    
    NSInteger tag = tapView.tag;
    if ([self.scDelegate respondsToSelector:@selector(bannerImageDidHandleWithIndex:)])  {
        [self.scDelegate bannerImageDidHandleWithIndex:tag];
    }
}




#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //guide样式
    if (_type == ImageScrollType_Guide)
    {
        // 获取滚动视图滚动的距离
        CGPoint pos = scrollView.contentOffset;
        
        // 获取当前的分页的下标
        NSInteger index = (int)(pos.x/self.frame.size.width);
        // 改变分页控制器的当前下标
        self.pageCtl.currentPage = index;
        
    }
    //banner样式
    else
    {
        // 获取滚动视图滚动的距离
        CGPoint pos = scrollView.contentOffset;
        //赋值
        _disX = pos.x;
        //如果滚动到第一个图片子视图将内容视图的起始位置变换置倒数第二张图的位置
        if (_disX == 0)
        {
            [self setContentOffset:CGPointMake(self.frame.size.width*_imgCount, 0) animated:NO];
            
        }
        else if (_disX == self.frame.size.width * (_imgCount+1))
        {
            [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
        }
        
        /*
         设置分页控制器当前分页
         */
        //最后一张图的点
        if (_disX == 0 || _disX == self.frame.size.width*_imgCount)
        {
            self.pageCtl.currentPage = _imgCount-1;
        }
        //第一张图片
        else if (_disX == self.frame.size.width || _disX == self.frame.size.width * (_imgCount+1))
        {
            self.pageCtl.currentPage = 0;
        }
        //其他图片
        else
        {
            self.pageCtl.currentPage = (int)(_disX / self.frame.size.width)-1;
        }
    }
    
    
}



@end
