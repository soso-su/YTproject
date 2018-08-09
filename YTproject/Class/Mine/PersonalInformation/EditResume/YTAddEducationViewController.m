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
@property (nonatomic ,strong) EducationModel *eduModel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end

@implementation YTAddEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"教育经历";
    
    [self setupView];
    self.detailTitlesArr = [[NSMutableArray alloc]initWithObjects:@"学校名称",@"专业名称",@"毕业时间",@"获得学位", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.isAdd) {
        self.eduModel = self.edModel;
    }
}

-(void)save{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSDictionary *dic = @{
                          @"school":YTReplaceNil(self.eduModel.school),
                          @"major":YTReplaceNil(self.eduModel.major),
                          @"graduation_time":YTReplaceNil(self.eduModel.graduation_time),
                          @"degree":YTReplaceNil(self.eduModel.degree)
                          };
    if (self.isAdd) {
        [self addEduExperienceWithDict:dic];
    }else{
        [dict addEntriesFromDictionary:dic];
        [dict setObject:[NSNumber numberWithInteger:self.eduModel.edu_id] forKey:@"id"];
        [self editEduExperienceWithDict:dict];
    }

}

- (IBAction)deleteEducation:(UIButton *)sender {
    [self deleteEduExperienceWithId:self.eduModel.edu_id];
}


-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    if (self.isAdd) {
        self.deleteButton.hidden = YES;
    }else{
        self.deleteButton.hidden = NO;
    }
}


- (EducationModel *)eduModel{
    if (!_eduModel) {
        _eduModel = [[EducationModel alloc]init];
    }
    return _eduModel;
}

#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    [cell.textField setEnabled:NO];
    cell.textField.placeholder = self.detailTitlesArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!self.isAdd) {
        switch (indexPath.row) {
            case 0:
                cell.textField.text = self.eduModel.school;
                break;
            case 1:
                cell.textField.text = self.eduModel.major;
                break;
            case 2:
                cell.textField.text = self.eduModel.graduation_time;
                break;
            default:
                cell.textField.text = self.eduModel.degree;
                break;
        }
    }
    return cell;
}

#pragma mark =======================UITableViewDelegate=========================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    YTWeakSelf
    YTEditResumeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (index == 0) {
        [cell.textField setEnabled:YES];
        [cell.textField becomeFirstResponder];
        [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (cell.textField.text.length > 0) {
                weakSelf.eduModel.school = cell.textField.text;
            }
        }];
    }else if (index == 1){
        [cell.textField setEnabled:YES];
        [cell.textField becomeFirstResponder];
        [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (cell.textField.text.length > 0) {
                weakSelf.eduModel.major = cell.textField.text;
            }
        }];
    }else if (index == 2) {
        [self.view endEditing:YES];
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy.MM"];
            NSString *str = [fmt stringFromDate:date];
            cell.textField.text = str;
            weakSelf.eduModel.graduation_time = str;
        }];
    }else if (index == 3){
        [self.view endEditing:YES];
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"专科",@"其他",nil];
        alertView.buttonClickHandle = ^(NSInteger buttonIndex) {
            switch (buttonIndex) {
                case 0:
                    cell.textField.text = @"博士";
                    break;
                case 1:
                    cell.textField.text = @"硕士";
                    break;
                case 2:
                    cell.textField.text = @"本科";
                    break;
                case 3:
                    cell.textField.text = @"专科";
                    break;
                default:
                    cell.textField.text = @"其他";
                    break;
            }
            weakSelf.eduModel.degree = cell.textField.text;
        };
        [alertView show];
    }
}

#pragma mark --------------------Http---------------------------


/**
 添加教育经历

 @param dic 提交参数
 */
- (void)addEduExperienceWithDict:(NSDictionary *)dic{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTAddEduExperience requestType:RequestType_post parameters:dic success:^(id responseObject) {
        
        @try {
            YTLog(@"responseObject = %@",responseObject);
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
            }else{
                
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
                
            }
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"YTAddEduExperience exception = %@",exception.description);
        }
        
        
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTAddEduExperience error = %@",error);
    }];
}


/**
 编辑教育经历

 @param dic 提交参数
 */
- (void)editEduExperienceWithDict:(NSDictionary *)dic{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTModifyEduExperience requestType:RequestType_post parameters:dic success:^(id responseObject) {
        @try {
            YTLog(@"responseObject = %@",responseObject);
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
                
            }
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"YTModifyEduExperience exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTModifyEduExperience error = %@",error);
    }];
}


/**
 删除教育经历

 @param edu_id id
 */
- (void)deleteEduExperienceWithId:(NSInteger)edu_id{
    YTWeakSelf
    NSDictionary *dict = @{
                           @"id":[NSNumber numberWithInteger:edu_id]
                           };
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTDelEduExperience requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            YTLog(@"responseObject = %@",responseObject);
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"YTDelEduExperience exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTDelEduExperience error = %@",error);
    }];
}

@end
