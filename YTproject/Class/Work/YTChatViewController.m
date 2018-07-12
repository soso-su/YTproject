//
//  YTChatViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/11.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTChatViewController.h"

@interface YTChatViewController ()

@end

@implementation YTChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setfile];
    [self setUpNav];
    [self.chatSessionInputBarControl.pluginBoardView removeAllItems];
    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"chatIconMoreResume"] title:nil tag:10];
}

- (void)setUpNav {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
    button.size = CGSizeMake(70, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customItem;
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 80)];
    UIImageView *userLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chatPic1"]];
    [bgView addSubview:userLogo];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    titleLabel.text = @"英途客服-AMY";
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(CGRectGetMaxX(userLogo.frame)+10, 0, titleLabel.width, titleLabel.height);
    titleLabel.centerY = userLogo.centerY;
    [bgView addSubview:titleLabel];
    
    self.navigationItem.titleView = bgView;
}

- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:path];
    [self sendMediaMessage:fileMessage pushContent:@"文件" appUpload:YES];
}

- (void)setfile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    
    NSString *string = @"1111111111";
    NSFileManager *fileManager =[NSFileManager defaultManager];
    [fileManager createFileAtPath:path contents:[string dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

- (void)didSendMessage:(NSInteger)status content:(RCMessageContent *)messageContent{
    if (status != 0) {
        
    }
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}




@end
