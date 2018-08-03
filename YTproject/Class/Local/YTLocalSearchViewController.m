//
//  YTLocalSearchViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTLocalSearchViewController.h"
#import "YTActiveDetailsViewController.h"
#import "LocalListCell.h"
#import "YTSearchView.h"
#define cellID @"ListCell"

@interface YTLocalSearchViewController ()<UITableViewDelegate,UITableViewDataSource,YTSearchViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)YTSearchView *searchView;

@end

@implementation YTLocalSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.tableView registerNib:[UINib nibWithNibName:@"LocalListCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)setNav{
    self.searchView = [[YTSearchView alloc]init];
    self.searchView.frame = CGRectMake(20, 0, kScreen_Width - 100, 30);
    self.searchView.delegate = self;
    self.searchView.text = @"白云山";
    self.navigationItem.titleView = self.searchView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 30);
    [button setTitle:@" 广州" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.0];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customItem;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocalListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.titleView.hidden = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YTActiveDetailsViewController *active = [[YTActiveDetailsViewController alloc]init];
    active.title = @"活动详情";
    [self.navigationController pushViewController:active animated:YES];
}

- (void)searchTextFieldDidBeginEditing:(UITextField *)textField{
    
}

- (void)searchTextFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)searchTextFieldShouldReturn:(UITextField *)textField{
    return YES;
}


@end
