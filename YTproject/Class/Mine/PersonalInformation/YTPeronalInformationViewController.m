//
//  YTPeronalInformationViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPeronalInformationViewController.h"

@interface YTPeronalInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;

@property (nonatomic,copy)NSArray *itemTitlesArr;
@property (nonatomic,copy)NSMutableArray *itemDetailTitlesArr;

@end

@implementation YTPeronalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = "个人资料";
    
    self.itemDetailTitlesArr = [NSMutableArray arrayWithArray:@[@"13712312312",@"ABC@gmail.com",@"男",@"1994-02-20"]];
    [self.bottomTableView reloadData];
}




#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.topTableView) {
        return 1;
    }else{
        return 4;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"porfileIconMore"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (tableView == self.topTableView) {
        cell.textLabel.text = @"昵称";
    }else{
        
        cell.textLabel.text = self.itemTitlesArr[indexPath.row];
        cell.detailTextLabel.text = self.itemDetailTitlesArr[indexPath.row];
    }
    
    return cell;
}

#pragma mark =======================UITableViewDelegate=========================

#pragma mark =======================Lazy=========================
-(NSArray *)itemTitlesArr
{
    if (!_itemTitlesArr) {
        _itemTitlesArr = @[@"手机",@"邮箱",@"性别",@"生日"];
    }
    
    return _itemTitlesArr;
}

-(NSMutableArray *)itemDetailTitlesArr
{
    if (!_itemDetailTitlesArr) {
        _itemDetailTitlesArr = [NSMutableArray arrayWithCapacity:4];
    }
    
    return _itemDetailTitlesArr ;
}
@end
