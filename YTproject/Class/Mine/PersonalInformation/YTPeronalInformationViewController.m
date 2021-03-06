//
//  YTPeronalInformationViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPeronalInformationViewController.h"
#import "YTModifyUsernameViewController.h"
#import "YTModifyPhoneOrEmailViewController.h"
#import "YTSelectSexView.h"
#import "YTDatePickerView.h"
#import "YTCheckIconViewController.h"


@interface YTPeronalInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;

@property (nonatomic,copy)NSArray *itemTitlesArr;
@property (nonatomic,copy)NSMutableArray *itemDetailTitlesArr;

@end

@implementation YTPeronalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人资料";
    
    [self.itemDetailTitlesArr addObjectsFromArray:@[@"13712312312",@"ABC@gmail.com",@"男",@"1994-02-20"]];
    [self.bottomTableView reloadData];
}

#pragma mark =======================ActionEvent=========================
- (IBAction)checkUserIcon:(UIButton *)sender {
    
    YTCheckIconViewController *vc = [[YTCheckIconViewController alloc]initWithIcon:sender.imageView.image];
    [self.navigationController pushViewController:vc animated:YES];
    
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
    if (tableView == self.topTableView) {
        YTModifyUsernameViewController *vc = [[YTModifyUsernameViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if (index == 0) { //修改手机号
            YTModifyPhoneOrEmailViewController *vc = [[YTModifyPhoneOrEmailViewController alloc]initWithType:ModifyPhone];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (index == 1) { //修改邮箱
            YTModifyPhoneOrEmailViewController *vc = [[YTModifyPhoneOrEmailViewController alloc]initWithType:ModifyEmail];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (index == 2){ //修改性别
            NSString *sex = self.itemDetailTitlesArr[2];
            SexType type;
            
            if ([sex isEqualToString:@"男"]) {
                type = Boy;
            }else{
                type = Girl;
            }
            
            [YTSelectSexView showWithDefaultSelectIndex:type SelectBlock:^(SexType sexType) {
                if (sexType == Boy) {
                    self.itemDetailTitlesArr[2] = @"男";
                }else{
                    self.itemDetailTitlesArr[2] = @"女";
                }
                
                [self.bottomTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
        
        if (index == 3) {//修改出生年月
            
            NSString *dateStr = self.itemDetailTitlesArr[3];
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy-MM-dd"];
            NSDate *defaultDate = [fmt dateFromString:dateStr];
            [YTDatePickerView showWithDefaultSelectDate:defaultDate SelectBlock:^(NSDate* date) {
                
                NSString *newDateStr = [fmt stringFromDate:date];
                self.itemDetailTitlesArr[3] = newDateStr;
                
                [self.bottomTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
    }
}
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
