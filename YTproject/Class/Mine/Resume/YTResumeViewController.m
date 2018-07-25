//
//  YTResumeViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTResumeViewController.h"
#import "YTEditResumeViewController.h"
#import "YTResumeHeaderView.h"
#import "YTResumeHeaderTableViewCell.h"
#import "YTResumeVideoTableViewCell.h"
#import "YTBaseInformationTableViewCell.h"
#import "YTWorkExperienceTableViewCell.h"
#import "YTEducationExperienceTableViewCell.h"
#import "YTCertificateTableViewCell.h"
#import "YTExpectaionWorkTableViewCell.h"

@interface YTResumeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSArray *sectionHeaderTitles;

@end

@implementation YTResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    [self setupData];
    
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");
}
-(void)editResume{
    YTEditResumeViewController *editVc = [[YTEditResumeViewController alloc]init];
    [self.navigationController pushViewController:editVc animated:YES];
}

#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    
    if (index == 0) {
        YTResumeHeaderTableViewCell *headerCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeHeaderTableViewCell class]) owner:self options:nil].lastObject;
        
        return headerCell;
    }
    
    if (index == 1){
    
        YTResumeVideoTableViewCell *videoVc = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeVideoTableViewCell class]) owner:self options:nil].lastObject;
        
        return  videoVc;
    }
    
    if (index == 2){//基本信息
        YTBaseInformationTableViewCell *baseInfCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTBaseInformationTableViewCell class]) owner:self options:nil].lastObject;
        
        return baseInfCell;
    }
    
    if (index == 3) {//工作经历
        YTWorkExperienceTableViewCell *workCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTWorkExperienceTableViewCell    class]) owner:self options:nil].lastObject;
        
        return workCell;
    }
    
    if (index == 4) {//教育经历
        YTEducationExperienceTableViewCell *eduCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTEducationExperienceTableViewCell    class]) owner:self options:nil].lastObject;
        
        return eduCell;
    }
    
    if (index == 5) {
        YTCertificateTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTCertificateTableViewCell class]) owner:self options:nil].lastObject;
        
        return cell;
    }
    
    if (index == 6) {
        YTExpectaionWorkTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTExpectaionWorkTableViewCell class]) owner:self options:nil].lastObject;
        
        return cell;
    }
    return [[UITableViewCell alloc]init];
}

#pragma mark =======================UITableViewDelegate=========================
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0 || section == 1){
        return [[UIView alloc]init];
    }
    
    YTResumeHeaderView *headerView = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeHeaderView class]) owner:self options:nil].lastObject;
    headerView.backgroundColor = RGB(242, 242, 242);
    
    BOOL isOdd = section%2; //判断是否是奇数
    if (isOdd){
        headerView.leftView.backgroundColor = RGB(255, 204, 67);
    }else{
        headerView.leftView.backgroundColor = RGB(255, 67, 67);
    }
    
    headerView.titleLabel.text = self.sectionHeaderTitles[section - 2];
    
    return headerView;
}

#pragma mark =======================Setup=========================
- (void)setupView{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editResume)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setupData{
    self.sectionHeaderTitles = @[@"基本信息",@"工作经历",@"教育经历",@"资格证书",@"期望工作"];
}

@end
