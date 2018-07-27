//
//  YTEditResumeWorkExperienceViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/26.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEditResumeWorkExperienceViewController.h"
#import "YTAddWorkExperienceViewController.h"
#import "YTAddEducationViewController.h"
#import "YTEditWorkTableViewCell.h"
#import "YTEducationExperienceViewController.h"

#define cellID @"EditWorkTableViewCell"

@interface YTEditResumeWorkExperienceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTEditResumeWorkExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"编辑简历";
    
    [self setupView];
}

#pragma mark =======================EventAction=========================
-(void)addWorkExperience{
    YTAddWorkExperienceViewController *vc = [[YTAddWorkExperienceViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)nextStep:(id)sender {
    YTEducationExperienceViewController *vc = [[YTEducationExperienceViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)preview{
    
}

#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditWorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    backgroundView.backgroundColor = UIColor.clearColor;
    
    UIButton *button = [[UIButton alloc]init];
    button.size = CGSizeMake(backgroundView.width - 30, 42);
    button.x = 15;
    button.centerY = backgroundView.height/2;
    button.layer.cornerRadius = 5.2;
    button.clipsToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"添加工作经历" forState:UIControlStateNormal];
    [button setTitleColor:DefaultColor forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"resumeBtn1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addWorkExperience) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    return backgroundView;
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditWorkTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

@end
