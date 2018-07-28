//
//  CPChatMessageViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPChatMessageViewController.h"
#import "CPChatListTableViewCell.h"
#import "YTChatViewController.h"

#define cellID  @"ChatListTableViewCell"

@interface CPChatMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CPChatMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CPChatListTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPChatListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTChatViewController *chat = [[YTChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
                                                                               targetId:@"yt1"];
    chat.title = @"JUICE";
    chat.conversationType = ConversationType_PRIVATE;
    chat.targetId = @"yt1";
    [self.navigationController pushViewController:chat animated:YES];
}

@end
