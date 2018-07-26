//
//  YTAddWorkExperienceViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAddWorkExperienceViewController.h"
#import "YTEditResumeTableViewCell.h"
#import "YTDatePickerView.h"

@interface YTAddWorkExperienceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,copy)NSMutableArray *detailTitlesArr;

@end

@implementation YTAddWorkExperienceViewController

static NSString *const TableViewCellId = @"TableViewCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"工作经历";
    
    [self setupView];
    
    self.detailTitlesArr = [[NSMutableArray alloc]initWithObjects:@"工作名称",@"职位",@"入职时间",@"离职时间", nil];
}


-(void)save{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)delete:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
    
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
    
    if (index == 2 || index == 3) {
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            
        }];
    }
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:TableViewCellId];
}


@end
