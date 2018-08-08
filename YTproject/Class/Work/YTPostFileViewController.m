//
//  YTPostFileViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTPostFileViewController.h"
#import "YTFileDetailsViewController.h"
#import "YTEditResumeBaseInformationViewController.h"
#import "SendfileCell.h"
#define cellID  @"fileCell"

@interface YTPostFileViewController ()<UITableViewDelegate,UITableViewDataSource,SendfileCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTPostFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YTWeakSelf
    [self.tableView registerNib:[UINib nibWithNibName:@"SendfileCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"发送简历";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    btn.frame = CGRectMake(0, 0, 35, 35);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    if (self.resumeList.count <= 0) {
        YTTouchView *touchView = [[YTTouchView alloc]initWithFrame:CGRectMake(15, 15, kScreen_Width - 30, 45)];
        touchView.layer.borderWidth = 0.7;
        touchView.layer.borderColor = RGB(200, 200, 200).CGColor;
        touchView.layer.cornerRadius = 4.0;
        [self.view addSubview:touchView];
        
        UILabel *tipLabel = [[UILabel alloc]init];
        tipLabel.text = @"请添加简历";
        tipLabel.font = [UIFont systemFontOfSize:13.0];
        tipLabel.textColor = RGB(51, 51, 51);
        [tipLabel sizeToFit];
        tipLabel.frame = CGRectMake(12, 0, tipLabel.width, tipLabel.height);
        tipLabel.centerY = touchView.height/2;
        [touchView addSubview:tipLabel];
        
        UIImageView *arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"porfileIconMore"]];
        [arrowView sizeToFit];
        arrowView.frame = CGRectMake(touchView.width - arrowView.width - 12, 0, arrowView.width, arrowView.height);
        arrowView.centerY = tipLabel.centerY;
        [touchView addSubview:arrowView];
        
        touchView.touchHandler = ^{
            YTEditResumeBaseInformationViewController *editVc = [[YTEditResumeBaseInformationViewController alloc]init];
            editVc.title = @"添加简历";
            [weakSelf.navigationController pushViewController:editVc animated:YES];
        };
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resumeList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SendfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)selectFile{
    YTFileDetailsViewController *fileDetails = [[YTFileDetailsViewController alloc]init];
    [self.navigationController pushViewController:fileDetails animated:YES];
}

@end
