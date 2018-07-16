//
//  YTTenementViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/16.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTTenementViewController.h"
#import "LocalListCell.h"
#import "YTMediumViewController.h"

#define cellID @"calList"

@interface YTTenementViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTTenementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"LocalListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocalListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.bannerView.image = [UIImage imageNamed:@"zfPic"];
    cell.msgLabel.text = @"MINITOP公寓 小户型单套间";
    cell.likeBtn.selected = YES;
    cell.collectionBtn.selected = YES;
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTMediumViewController *medium = [[YTMediumViewController alloc]init];
    medium.title = [NSString stringWithFormat:@"%@详情",self.title];
    [self.navigationController pushViewController:medium animated:YES];
}

@end
