//
//  YTResumeViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTResumeViewController.h"
#import "YTEditResumeBaseInformationViewController.h"
#import "YTResumeHeaderView.h"
#import "YTResumeHeaderTableViewCell.h"
#import "YTResumeVideoTableViewCell.h"
#import "YTBaseInformationTableViewCell.h"
#import "YTWorkExperienceTableViewCell.h"
#import "YTEducationExperienceTableViewCell.h"
#import "YTCertificateTableViewCell.h"
#import "YTExpectaionWorkTableViewCell.h"
#import "ResumeModel.h"

@interface YTResumeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSArray *sectionHeaderTitles;
@property (nonatomic ,strong) ResumeModel *resumModel;

@end

@implementation YTResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简历详情";
    [self setupView];
    
    [self setupData];
    
//    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self resumeDetail];

}

- (void)viewDidAppear:(BOOL)animated{
//    NSLog(@"viewDidAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
//    NSLog(@"viewDidDisappear");
}
-(void)editResume{
    YTEditResumeBaseInformationViewController *editVc = [[YTEditResumeBaseInformationViewController alloc]init];
    editVc.title = @"编辑简历";
    [self.navigationController pushViewController:editVc animated:YES];
}

- (ResumeModel *)resumModel{
    if (!_resumModel) {
        _resumModel = [[ResumeModel alloc]init];
    }
    return _resumModel;
}

#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.resumModel.workExperienceList.count;
    }else if (section == 4){
        return self.resumModel.eduExperienceList.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    
    if (index == 0) {
        YTResumeHeaderTableViewCell *headerCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeHeaderTableViewCell class]) owner:self options:nil].lastObject;
        headerCell.model = self.resumModel;
        headerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return headerCell;
    }
    
    if (index == 1){
    
        YTResumeVideoTableViewCell *videoVc = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeVideoTableViewCell class]) owner:self options:nil].lastObject;
        videoVc.selectionStyle = UITableViewCellSelectionStyleNone;
        return  videoVc;
    }
    
    if (index == 2){//基本信息
        YTBaseInformationTableViewCell *baseInfCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTBaseInformationTableViewCell class]) owner:self options:nil].lastObject;
        baseInfCell.model = self.resumModel;
        baseInfCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return baseInfCell;
    }
    
    if (index == 3) {//工作经历
        YTWorkExperienceTableViewCell *workCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTWorkExperienceTableViewCell    class]) owner:self options:nil].lastObject;
        workCell.model = self.resumModel.workExperienceList[indexPath.row];
        workCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return workCell;
    }
    
    if (index == 4) {//教育经历
        YTEducationExperienceTableViewCell *eduCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTEducationExperienceTableViewCell    class]) owner:self options:nil].lastObject;
        eduCell.model = self.resumModel.eduExperienceList[indexPath.row];
        eduCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return eduCell;
    }
    
    if (index == 5) {
        YTCertificateTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTCertificateTableViewCell class]) owner:self options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (index == 6) {
        YTExpectaionWorkTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTExpectaionWorkTableViewCell class]) owner:self options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 10;
    }else
        return 28;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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


#pragma mark ----------------------Http---------------------------

- (void)resumeDetail{
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTResumeDetail requestType:RequestType_post parameters:nil success:^(id responseObject) {
        YTLog(@"YTResumeDetail responseObject = %@",responseObject);
        @try {
            weakSelf.resumModel.resume = [EditResumeModel yy_modelWithJSON:responseObject[@"resume"]];
            weakSelf.resumModel.workExperienceList = [NSArray yy_modelArrayWithClass:[WorkExperienceModel class] json:responseObject[@"workExperienceList"]];
            
            weakSelf.resumModel.eduExperienceList = [NSArray yy_modelArrayWithClass:[EducationModel class] json:responseObject[@"eduExperienceList"]];
            [weakSelf.tableView reloadData];
        } @catch (NSException *exception) {
            YTLog(@"YTResumeDetail exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        YTLog(@"YTResumeDetail error = %@",error);
    }];
}

@end
