//
//  YTMoreViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTMoreViewController.h"
#import "MoreCell.h"
#import "YTSearchView.h"
#import "YTProductDetailViewController.h"

#define cellID  @"moreCell"

@interface YTMoreViewController ()<UITableViewDelegate,UITableViewDataSource,YTSearchViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceAscendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceDescendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesAscendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesDescendingBtn;
@property (strong, nonatomic) YTSearchView *searchView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation YTMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isSearch) {
        [self setNav];
    }
    [self setUpUI];
    
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"MoreCell" bundle:nil] forCellReuseIdentifier:cellID];
}

- (void)setNav{
    
    
    self.searchView = [[YTSearchView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - 120, 30)];
    self.searchView.delegate = self;
    self.navigationItem.titleView = self.searchView;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSearch:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.isCollect = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTProductDetailViewController *productVc = [[YTProductDetailViewController alloc]init];
    [self.navigationController pushViewController:productVc animated:YES];
}

- (IBAction)priceAscending:(UIButton *)sender {
}
- (IBAction)priceDescendingBtn:(UIButton *)sender {
}

- (IBAction)salesAscending:(UIButton *)sender {
}

- (IBAction)salesDescending:(UIButton *)sender {
}

- (void)cancelSearch:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchTextFieldDidEndEditing:(UITextField *)textField{
    
}

- (void)searchTextFieldDidBeginEditing:(UITextField *)textField{
    
}

- (BOOL)searchTextFieldShouldReturn:(UITextField *)textField{
    return YES;
}



@end
