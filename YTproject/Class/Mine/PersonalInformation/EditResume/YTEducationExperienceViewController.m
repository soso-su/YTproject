//
//  YTEducationExperienceViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEducationExperienceViewController.h"
#import "YTEditWorkTableViewCell.h"
#import "YTAddEducationViewController.h"
#import "YTExpectWorkViewController.h"
#import "ResumeModel.h"
#import "YTResumeViewController.h"

#define cellID @"editWorkTableViewCell"

@interface YTEducationExperienceViewController ()<UITableViewDelegate,UITableViewDataSource,YTEditWorkTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)ResumeModel *resumModel;

@end

@implementation YTEducationExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑简历";
    
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self editResume];
}

- (ResumeModel *)resumModel{
    if (!_resumModel) {
        _resumModel = [[ResumeModel alloc]init];
    }
    return _resumModel;
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditWorkTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resumModel.eduExperienceList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditWorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isWork = NO;
    cell.delegate = self;
    cell.edModel = self.resumModel.eduExperienceList[indexPath.row];
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
    [button setTitle:@"添加教育经历" forState:UIControlStateNormal];
    [button setTitleColor:DefaultColor forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"resumeBtn1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addEducationExperience) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    return backgroundView;
}

- (IBAction)next:(UIButton *)sender {
    YTExpectWorkViewController *vc = [[YTExpectWorkViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)addEducationExperience{
    YTAddEducationViewController *vc = [[YTAddEducationViewController alloc]init];
    vc.isAdd = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)editExperienceWithModel:(EducationModel *)model{
    YTAddEducationViewController *vc = [[YTAddEducationViewController alloc]init];
    vc.edModel = model;
    vc.isAdd = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ------------------Http--------------------

/**
 编辑简历
 */
- (void)editResume{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTEditResume requestType:RequestType_get parameters:nil success:^(id responseObject) {
        YTLog(@"editResume responseObject = %@",responseObject);
        @try {
            [YTProgressHUD dismissHUD];
            weakSelf.resumModel.resume = [EditResumeModel yy_modelWithJSON:responseObject[@"resume"]];
            weakSelf.resumModel.workExperienceList = [NSArray yy_modelArrayWithClass:[WorkExperienceModel class] json:responseObject[@"workExperienceList"]];
            
            weakSelf.resumModel.eduExperienceList = [NSArray yy_modelArrayWithClass:[EducationModel class] json:responseObject[@"eduExperienceList"]];
            [weakSelf.tableView reloadData];
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"editResume exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"editResume error = %@",error);
    }];
}


@end
