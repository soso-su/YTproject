//
//  YTWorkDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkDetailViewController.h"
#import "YTCompanyViewController.h"
#import "YTPostFileViewController.h"
#import "YTChatViewController.h"
#import "CustomButton.h"
#import "ShareView.h"

@interface YTWorkDetailViewController ()<ShareViewDelegate>
@property (weak, nonatomic) IBOutlet YTTouchView *companyView;
@property (strong, nonatomic)ShareView *shareView;
@property (weak, nonatomic) IBOutlet CustomButton *shareBtn;
@property (weak, nonatomic) IBOutlet CustomButton *interestsBtn;

@end

@implementation YTWorkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.title = @"职业详情";
    self.shareBtn.customButtonType = ImageUpLabelDown;
    self.interestsBtn.customButtonType = ImageUpLabelDown;
    [[YTTool getWindow] addSubview:self.shareView];
}

- (void)setNav{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navCollect"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navCollectPre"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 35, 35);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.companyView.touchHandler = ^{
        YTCompanyViewController *companyVc = [[YTCompanyViewController alloc]init];
        [self.navigationController pushViewController:companyVc animated:YES];
    };
}

- (void)clickRightButton:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)clickCloseBtn{
    self.shareView.hidden = YES;
}

- (IBAction)share:(CustomButton *)sender {
    self.shareView.hidden = NO;
}

- (IBAction)interest:(CustomButton *)sender {
}
- (IBAction)sendFile:(UIButton *)sender {
    YTPostFileViewController *fileVc = [[YTPostFileViewController alloc]init];
    [self.navigationController pushViewController:fileVc animated:YES];
}
- (IBAction)callhr:(UIButton *)sender {
    YTChatViewController *chat = [[YTChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
                                                                               targetId:@"yt2"];
    chat.title = @"马蜂窝hr-Amy";
    chat.conversationType = ConversationType_PRIVATE;
    chat.targetId = @"yt2";
    [self.navigationController pushViewController:chat animated:YES];
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
