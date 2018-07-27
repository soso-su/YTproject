//
//  YTSettingViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSettingViewController.h"
#import "OrderTipcView.h"
#import "YTMessageViewController.h"
#import "YTPwsdViewController.h"
#import "YTLoginViewController.h"
#import "YTCameraViewController.h"

@interface YTSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *itemTitleArr;


@end

@implementation YTSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.tableView.scrollEnabled = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, tableView.width, tableView.rowHeight)];
    cell.textLabel.text = self.itemTitleArr[indexPath.row];
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 2) {
        UILabel *sizeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width - 140, 0, 90, cell.contentView.height)];
        sizeLabel.textColor = RGB(51, 51, 51);
        sizeLabel.font = [UIFont systemFontOfSize:13.0];
        sizeLabel.textAlignment = NSTextAlignmentRight;
        sizeLabel.text = @"50M";
        [cell.contentView addSubview:sizeLabel];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        YTMessageViewController *messageVc = [[YTMessageViewController alloc]init];
        [self.navigationController pushViewController:messageVc animated:YES];
    }else if (indexPath.row == 1){
        YTPwsdViewController *pswdVc = [[YTPwsdViewController alloc]init];
        [self.navigationController pushViewController:pswdVc animated:YES];
    }else if (indexPath.row == self.itemTitleArr.count - 1) {
        [OrderTipcView showWithStr:@"确定注销？" type:TextCenter callBack:^{
            
            YTLoginViewController *loginVc = [[YTLoginViewController alloc]init];
            [YTTool getWindow].rootViewController = loginVc;
            
        }];
    }
}



- (NSArray *)itemTitleArr{
    if (!_itemTitleArr) {
        _itemTitleArr = @[@"消息通知",@"修改密码",@"清除缓存",@"检查更新",@"注销"];
    }
    return _itemTitleArr;
}


@end
