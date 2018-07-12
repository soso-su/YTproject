//
//  TYRotateImageView.h
//  YTproject
//
//  Created by suhuahao on 2018/7/3.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ImageScrollType_Guide = 100,   // 开机guide视图样式
    ImageScrollType_Banner
}ImageScrollType;

@protocol TYRotateImageViewDelegate <NSObject>
@optional
/// “guide”样式的最后一个视图上的“立即体验”按钮触发
-(void)experienceDidHandle;
/// “banner”样式每一个图片触发回调的方法;index表示选中的图片的下标
-(void)bannerImageDidHandleWithIndex:(NSInteger)index;

@end

@interface TYRotateImageView : UIScrollView

@property (nonatomic, assign)ImageScrollType type;

@property (nonatomic, strong)NSArray *imageNameArr;

@property (nonatomic, strong)NSString *title;

@property (nonatomic, strong)UIColor *titleColor;

@property (nonatomic, assign)CGRect btnFrame;

@property (nonatomic, assign)NSTimeInterval interval;

@property (nonatomic, assign)id <TYRotateImageViewDelegate>rotateDelegate;

/// 参数1：滚动视图位置（建议以4.7寸屏设置）; 参数2：样式 ; 参数3：图片名称数组 ; 参数4：guide样式的“立即体验”按钮标题；参数5:字体颜色 参数6：guide样式的“立即体验”按钮位置；参数7：banner轮播图时间间隔 ; 参数8：代理设置，用于触发事件回调
-(instancetype)initWithFrame:(CGRect)frame
                       style:(ImageScrollType)type
                      images:(NSArray *)imgNameArr
             confirmBtnTitle:(NSString *)title
        confirmBtnTitleColor:(UIColor *)titleColor
             confirmBtnFrame:(CGRect)btnFrame
      autoScrollTimeInterval:(NSTimeInterval)interval
                    delegate:(id<TYRotateImageViewDelegate>)delegate;

/// 给ImageScrollView的父视图添加分页控件,必须把ImageScrollView加为父视图的子视图之后再调用方法
-(void)addPageControlToSuperView:(UIView *)superView;

@end
