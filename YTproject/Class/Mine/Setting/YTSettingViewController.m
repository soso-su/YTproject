//
//  YTSettingViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSettingViewController.h"

@interface YTSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *itemTitleArr;

@end

@implementation YTSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, tableView.width, tableView.rowHeight)];
    cell.detailTextLabel.text = @"1111";
    cell.textLabel.text = self.itemTitleArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"porfileIconMore"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSArray *)itemTitleArr{
    if (!_itemTitleArr) {
        _itemTitleArr = @[@"消息通知",@"修改密码",@"清除缓存",@"检查更新",@"注销"];
    }
    return _itemTitleArr;
}

@end
