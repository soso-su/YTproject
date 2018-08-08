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
#import "EducationModel.h"

#define cellID @"EditResumeTableViewCell"

@interface YTAddEducationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *detailTitlesArr;
@property (nonatomic ,strong) EducationModel *eduModel;

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
    NSDictionary *dic = @{
                          @"school":YTReplaceNil(self.eduModel.school),
                          @"major":YTReplaceNil(self.eduModel.major),
                          @"graduation_time":YTReplaceNil(self.eduModel.graduation_time),
                          @"degree":YTReplaceNil(self.eduModel.degree)
                          };
    [self addEduExperienceWithDict:dic];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteEducation:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setupView{
    self.eduModel = [[EducationModel alloc]init];
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
    [cell.textField setEnabled:NO];
    cell.textField.placeholder = self.detailTitlesArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if (indexPath.row == 2 || indexPath.row == 3) {
//        [cell.textField setEnabled:NO];
//    }
    
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
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate *date) {
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy-MM-dd"];
            NSString *str = [fmt stringFromDate:date];
            cell.textField.text = str;
            weakSelf.eduModel.graduation_time = str;
        }];
    }else if (index == 3){
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

- (void)addEduExperienceWithDict:(NSDictionary *)dic{
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTAddEduExperience requestType:RequestType_post parameters:dic success:^(id responseObject) {
        if ([responseObject[YTCode] integerValue] == YTCode2000) {
            [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
            [weakSelf.navigationController popViewControllerAnimated:YES];
            YTLog(@"responseObject = %@",responseObject);
        }else{
            
            [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            
        }
    } failure:^(NSError *error) {
        YTLog(@"YTAddEduExperience error = %@",error);
    }];
}


@end
