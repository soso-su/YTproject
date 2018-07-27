//
//  YTAddEducationViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAddEducationViewController.h"
#import "YTEditResumeTableViewCell.h"
#import "YTDatePickerView.h"
#import "YTAlertView.h"

#define cellID @"EditResumeTableViewCell"

@interface YTAddEducationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *detailTitlesArr;

@end

@implementation YTAddEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"教育经历";
    
    [self setupView];
    self.detailTitlesArr = [[NSMutableArray alloc]initWithObjects:@"学校名称",@"专业名称",@"毕业时间",@"获得学位", nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)save{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteEducation:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}


#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textField.text = self.detailTitlesArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 2 || indexPath.row == 3) {
        [cell.textField setEnabled:NO];
    }
    
    return cell;
}

#pragma mark =======================UITableViewDelegate=========================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
    if (index == 2) {
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            
        }];
    }else if (index == 3){
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"专科",@"其他",nil];
        [alertView show];
    }
}


@end
