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
    self.chatSessionInputBarControl.backgroundColor = RGB(238, 238, 238);
    self.chatSessionInputBarControl.pluginBoardView.contentView.backgroundColor = RGB(238, 238, 238);
    
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
    titleLabel.text = self.title;
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(CGRectGetMaxX(userLogo.frame)+10, 0, titleLabel.width, titleLabel.height);
    titleLabel.centerY = userLogo.centerY;
    [bgView addSubview:titleLabel];
    
    self.navigationItem.titleView = bgView;
}

- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    [super willDisplayMessageCell:cell atIndexPath:indexPath];
     RCMessageModel *model = self.conversationDataRepository[indexPath.row];
    if ([cell isMemberOfClass:[RCTextMessageCell class]] ) {
        RCTextMessageCell *textCell = (RCTextMessageCell *)cell;
        NSString *bubbleImageName = @"";
        
        if (model.messageDirection==MessageDirection_SEND) {
            bubbleImageName = @"chat_icon_4";
        }
        UIImage *image = [UIImage imageNamed:bubbleImageName];
        if ([image CIImage]==nil && [image CGImage]==NULL) {
            if (model.messageDirection==MessageDirection_SEND) {
                image = [UIImage imageNamed:@"chat_icon_4"];
            } else {
                image = [UIImage imageNamed:@"chatIcon1"];
            }
        }
        
        UIEdgeInsets edgeInsets;
        if (model.messageDirection==MessageDirection_SEND) {
            edgeInsets = UIEdgeInsetsMake(25.0, 10.0, 10.0, 15.0);
        } else {
            edgeInsets = UIEdgeInsetsMake(25.0, 15.0, 10.0, 10.0);
        }
        textCell.bubbleBackgroundView.image = [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch];
        CGFloat x = model.messageDirection==MessageDirection_SEND ? 3.0:-3.0;
        textCell.textLabel.frame = CGRectMake(CGRectGetMinX(textCell.textLabel.frame)+x, CGRectGetMinY(textCell.textLabel.frame), CGRectGetWidth(textCell.textLabel.frame), CGRectGetHeight(textCell.textLabel.frame));
    }else if ([cell isMemberOfClass:[RCFileMessageCell class]]){
        RCFileMessageCell *fileCell = (RCFileMessageCell *)cell;
        if (model.messageDirection==MessageDirection_SEND) {
            fileCell.typeIconView.image = [UIImage imageNamed:@"chatIconResume"];
            fileCell.sizeLabel.text = @"";
            fileCell.nameLabel.text = @"李至深的个人简历";
        }
    }
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

- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent{
    if ([messageContent isKindOfClass:[RCFileMessage class]]) {
        
    }
    return messageContent;
}

- (void)didTapMessageCell:(RCMessageModel *)model{
    [super didTapMessageCell:model];
    if ([model.content isKindOfClass:[RCFileMessage class]]) {
        
    }
    
//    if ([model.content isKindOfClass:[RCContactCardMessage class]]) {
//        RCContactCardMessage *cardMSg = (RCContactCardMessage *)model.content;
//        RCUserInfo *user =
//        [[RCUserInfo alloc] initWithUserId:cardMSg.userId name:cardMSg.name portrait:cardMSg.portraitUri];
//        [self gotoNextPage:user];
//    }
}


- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}




@end
