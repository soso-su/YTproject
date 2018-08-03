//
//  YTFileDetailsViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/13.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTFileDetailsViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "YTEditResumeBaseInformationViewController.h"

@interface YTFileDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIView *vedioView;
@property (weak, nonatomic) IBOutlet UILabel *baseMessageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

@end

@implementation YTFileDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setVedioView:(UIView *)vedioView{
    _vedioView = vedioView;
    AVPlayer *player = [AVPlayer playerWithURL:[[NSBundle mainBundle] URLForResource:@"IMG_9638.m4v" withExtension:nil]];
    AVPlayerViewController*controller=[[AVPlayerViewController alloc]init];
    controller.player = player;
    controller.view.frame = CGRectMake(10, 10, vedioView.width - 20, vedioView.height - 20);
    [vedioView addSubview:controller.view];
    [self addChildViewController:controller];
}


- (void)setUpUI{
    self.title = @"简历详情";
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    sendBtn.frame = CGRectMake(0, 0, 35, 35);
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    editBtn.frame = CGRectMake(0, 0, 35, 35);
    YTWeakSelf
    [[editBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YTEditResumeBaseInformationViewController *editVc = [[YTEditResumeBaseInformationViewController alloc]init];
        [weakSelf.navigationController pushViewController:editVc animated:YES];
    }];
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc]initWithCustomView:sendBtn];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithCustomView:editBtn];
    
    if (self.isMine) {
        self.navigationItem.rightBarButtonItem = editItem;
    }else{
        self.navigationItem.rightBarButtonItems = @[sendItem,editItem];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLogo:)];
    self.logoView.userInteractionEnabled = YES;
    [self.logoView addGestureRecognizer:tap];
    
    self.baseMessageLabel.text = @"最高学历：本科\n工作年限：3年\n出生年月：1992.05\n国籍：叙利亚\n性别：男\n语言：阿拉伯语";
    [YTTool setLabelAttributeLineHeight:12 label:self.baseMessageLabel];
}

- (void)clickLogo:(UITapGestureRecognizer *)tap{
    YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择",@"取消",nil];
    [alertView show];
}

@end
