//
//  CPMyCompanyViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/28.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "CPMyCompanyViewController.h"
#import "CPMyCompanyTableViewCell.h"
#import "YTSelectWorkTypeViewController.h"
#import "CPModiflyCompanyTellViewController.h"
#import "CPEditCompanyMsgViewController.h"

#define cellID  @"MyCompanyTableViewCell"

@interface CPMyCompanyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) UIButton *button;

@end

@implementation CPMyCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公司信息";
    self.titleArray = @[@"规模",@"行业",@"联系电话",@"简介和标签"];
    self.textArray = @[@"2000以上",@"教育/语言/英语",@"0202-38392287",@""];
    [self.tableView registerNib:[UINib nibWithNibName:@"CPMyCompanyTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:18],NSFontAttributeName, RGB(51 ,51,51),NSForegroundColorAttributeName ,nil];
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    UIImage *image = [UIImage imageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setUpNav];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:18],NSFontAttributeName, RGB(255 ,255,255),NSForegroundColorAttributeName ,nil];
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    UIImage *image = [UIImage imageWithColor:DefaultColor];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setUpNav];
    [self.button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
}


- (void)setUpNav {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customItem;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPMyCompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.isHideImage = YES;
    cell.leftLabel.text = self.titleArray[indexPath.row];
    cell.rightLabel.text = self.textArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == self.titleArray.count - 1) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        YTAlertView *alert = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"2000人以上",@"500-2000人",@"200-500人",@"100-200人",@"50-100人",@"20-50人",@"20人以下",nil];
        alert.buttonClickHandle = ^(NSInteger buttonIndex) {
            
        };
        [alert show];
    }else if (indexPath.row == 1){
        YTSelectWorkTypeViewController *typeVc = [[YTSelectWorkTypeViewController alloc]init];
        typeVc.title = @"选择行业";
        [self.navigationController pushViewController:typeVc animated:YES];
    }else if (indexPath.row == 2){
        CPModiflyCompanyTellViewController *vc = [[CPModiflyCompanyTellViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        CPEditCompanyMsgViewController *vc = [[CPEditCompanyMsgViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)backControl:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
