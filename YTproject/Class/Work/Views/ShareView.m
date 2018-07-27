//
//  ShareView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ShareView.h"

@interface ShareView()
@property(nonatomic,weak)UIView *footView;
@end

@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI{
    CGFloat footH = 235;
    CGFloat closeH = 42;
    CGFloat top = 20;
    CGFloat btnW = 70;
    CGFloat btnH = 90;
   
    CGFloat margin = (kScreen_Width - btnW*4)/5;
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - footH, kScreen_Width, footH)];
    footView.backgroundColor = [UIColor whiteColor];
    [self addSubview:footView];
    self.footView = footView;
    
    YTTouchView *weChat = [self setTouchViewWithFrame:CGRectMake(margin, top, btnW, btnH) imageName:@"shareIconWechat" title:@"微信好友"];
    [footView addSubview:weChat];

    
    YTTouchView *circle = [self setTouchViewWithFrame:CGRectMake(CGRectGetMaxX(weChat.frame)+margin, top, btnW, btnH) imageName:@"shareIconFriend" title:@"朋友圈"];
    [footView addSubview:circle];
    
    YTTouchView *weibo = [self setTouchViewWithFrame:CGRectMake(CGRectGetMaxX(circle.frame)+margin, top, btnW, btnH) imageName:@"shareIconWeibo" title:@"新浪微博"];
    [footView addSubview:weibo];
    
    
    YTTouchView *copy = [self setTouchViewWithFrame:CGRectMake(CGRectGetMaxX(weibo.frame)+margin, top, btnW, btnH) imageName:@"shareIconLink" title:@"复制链接"];
    [footView addSubview:copy];
    
    
    YTTouchView *facebook = [self setTouchViewWithFrame:CGRectMake(margin, CGRectGetMaxY(weChat.frame), btnW, btnH) imageName:@"shareIconFacebook" title:@"Facebook"];
    [footView addSubview:facebook];
    
    YTTouchView *twitter = [self setTouchViewWithFrame:CGRectMake(CGRectGetMaxX(facebook.frame)+margin, CGRectGetMaxY(circle.frame), btnW, btnH) imageName:@"shareIconTwitter" title:@"Twitter"];
    [footView addSubview:twitter];
    
    YTTouchView *lines = [self setTouchViewWithFrame:CGRectMake(CGRectGetMaxX(twitter.frame)+margin, CGRectGetMaxY(weibo.frame), btnW, btnH) imageName:@"shareIconLine" title:@"LINE"];
    [footView addSubview:lines];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, footView.height - closeH - 1, kScreen_Width, 1)];
    line.backgroundColor = RGB(220, 220, 220);
    [footView addSubview:line];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(0, CGRectGetMaxY(line.frame), kScreen_Width, closeH);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [closeBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:closeBtn];
    
}

-(YTTouchView *)setTouchViewWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title{
    CGFloat bW = 10;
    CGFloat bH = 50;
    YTTouchView *touchView = [[YTTouchView alloc]initWithFrame:frame];
    UIView *bordView = [[UIView alloc]initWithFrame:CGRectMake(bW, 0, bH, bH)];
    bordView.layer.cornerRadius = 6.0;
    bordView.layer.borderWidth = 1.0;
    bordView.layer.borderColor = RGB(230, 230, 230).CGColor;
    [touchView addSubview:bordView];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [bordView addSubview:imageView];
    [imageView sizeToFit];
    imageView.centerY = bordView.height/2;
    imageView.centerX = bordView.width/2;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = RGB(51, 51, 51);
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(0, CGRectGetMaxY(bordView.frame)+bW, titleLabel.width, titleLabel.height);
    titleLabel.centerX = bordView.centerX;
    [touchView addSubview:titleLabel];
    
    return touchView;
}


- (void)close:(UIButton *)sender{
    if (self.delegate) {
        [self.delegate clickCloseBtn];
    }
}

@end
