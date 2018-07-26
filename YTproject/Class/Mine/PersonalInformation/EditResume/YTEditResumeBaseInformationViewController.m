//
//  YTEditResumeViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEditResumeBaseInformationViewController.h"
#import "YTEditResumeTableViewCell.h"
#import "YTSelectSexView.h"
#import "YTDatePickerView.h"
#import "YTAlertView.h"
#import "YTEditResumeWorkExperienceViewController.h"

@interface YTEditResumeBaseInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *detailTitleArr;

@end

@implementation YTEditResumeBaseInformationViewController

static NSString *const TableViewCellId = @"TableViewCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"编辑简历";
    
    [self setupView];
   
    self.detailTitleArr = [[NSMutableArray alloc]initWithObjects:@"姓名",@"国籍",@"男",@"语言",@"1992.06.01",@"最高学历",@"工作年限",@"签证类型",@"一句话描述自己", nil];
}

- (void)preview{
    
}

- (IBAction)nextStep:(UIButton *)sender {
    YTEditResumeWorkExperienceViewController *vc = [[YTEditResumeWorkExperienceViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 9){
        
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        cell.backgroundColor = UIColor.clearColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"目前居住城市";
        cell.textLabel.x = 0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        cell.indentationLevel = 1;
        cell.indentationWidth = 1;
        cell.textLabel.textColor = UIColor.blackColor;
        cell.detailTextLabel.text = @"广州";
        
        return cell;
    }else{
        
        YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
        cell.textField.text = self.detailTitleArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ((indexPath.row == 2) || (indexPath.row == 4)||(indexPath.row == 5)) {
            [cell.textField setEnabled:NO];
        }
        
        return cell;
    }
}

#pragma mark =======================UITableViewDelegate=========================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
    if (index == 2) { //选择性别
        [YTSelectSexView showWithDefaultSelectIndex:nil SelectBlock:^(SexType type) {
            
        }];
    }
    
    if (index == 4) {
        [YTDatePickerView showWithDefaultSelectDate:nil SelectBlock:^(NSDate * data) {
            
        }];
    }
    
    if (index == 5) {
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"其他",nil];
        [alertView show];
    }
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:TableViewCellId];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

@end
