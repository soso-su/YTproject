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


@interface YTAddWorkExperienceViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,copy)NSMutableArray *detailTitlesArr;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic ,strong) WorkExperienceModel *workModel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.isAdd) {
        self.workModel = self.model;
        self.textView.text = self.workModel.work_content;
    }
}


-(void)save{
    [self.textView resignFirstResponder];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSDictionary *dic = @{
                          @"company_name":self.workModel.company_name,
                          @"position_name":self.workModel.position_name,
                          @"start_time":self.workModel.start_time,
                          @"end_time":self.workModel.end_time,
                          @"work_content":self.workModel.work_content
                          };
    if (self.isAdd) {
        
        [self addWorkExperienceWithDict:dic];
    }else{
        [dict addEntriesFromDictionary:dic];
        [dict setObject:@(self.workModel.work_experience_id) forKey:@"id"];
        [self editWorkExperienceWithDict:dict];
    }
}

- (IBAction)delete:(UIButton *)sender {
    [self deleteWorkExperienceWithId:self.workModel.work_experience_id];
}

- (WorkExperienceModel *)workModel{
    if (!_workModel) {
        _workModel = [[WorkExperienceModel alloc]init];
    }
    return _workModel;
}


#pragma mark ---------------UITextViewDelegate---------------
-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length > 0) {
        self.workModel.work_content = textView.text;
    }
}


#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!self.isAdd) {
        switch (indexPath.row) {
            case 0:
                cell.textField.text = self.workModel.company_name;
                break;
            case 1:
                cell.textField.text = self.workModel.position_name;
                break;
            case 2:
                cell.textField.text = self.workModel.start_time;
                break;
            default:
                cell.textField.text = self.workModel.end_time;
                break;
        }
    }
    cell.textField.placeholder = self.detailTitlesArr[indexPath.row];
    [cell.textField setEnabled:NO];
    
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
                weakSelf.workModel.company_name = cell.textField.text;
            }
        }];
    }else if (index == 1){
        [cell.textField setEnabled:YES];
        [cell.textField becomeFirstResponder];
        [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (cell.textField.text.length > 0) {
                weakSelf.workModel.position_name = cell.textField.text;
            }
        }];
    }else if (index == 2) {
        [self.view endEditing:YES];
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy.MM"];
            NSString *str = [fmt stringFromDate:date];
            cell.textField.text = str;
            weakSelf.workModel.start_time = str;
        }];
    }else{
        [self.view endEditing:YES];
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy.MM"];
            NSString *str = [fmt stringFromDate:date];
            cell.textField.text = str;
            weakSelf.workModel.end_time = str;
        }];
    }
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:TableViewCellId];
    if (self.isAdd) {
        self.deleteButton.hidden = YES;
    }
}


#pragma mark ---------------Http-----------------------


/**
 添加工作经历

 @param dict 提交信息
 */
- (void)addWorkExperienceWithDict:(NSDictionary *)dict{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTAddWorkExperience requestType:RequestType_post parameters:dict success:^(id responseObject) {
        YTLog(@"YTAddWorkExperience responseObject = %@",responseObject);
        @try {
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            YTLog(@"YTAddWorkExperience exception = %@",exception.description);
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
        }
        
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTAddWorkExperience error = %@",error);
    }];
}


/**
 编辑工作经历

 @param dict 提交信息
 */
- (void)editWorkExperienceWithDict:(NSDictionary *)dict{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTModifyWorkExperience requestType:RequestType_post parameters:dict success:^(id responseObject) {
        YTLog(@"YTModifyWorkExperience responseObject = %@",responseObject);
        @try {
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            YTLog(@"YTModifyWorkExperience exception = %@",exception.description);
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
        }
        
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTModifyWorkExperience error = %@",error);
    }];
}

- (void)deleteWorkExperienceWithId:(NSInteger)work_id{
    NSDictionary *dict = @{
                           @"id":[NSNumber numberWithInteger:work_id]
                           };
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTDelWorkExperience requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            YTLog(@"YTDelWorkExperience exception = %@",exception.description);
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"YTDelWorkExperience error = %@",error);
    }];
}


@end
