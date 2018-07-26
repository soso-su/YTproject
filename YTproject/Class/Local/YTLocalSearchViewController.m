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
    self.searchView.frame = CGRectMake(0, 0, kScreen_Width - 80, 30);
    self.searchView.delegate = self;
    self.navigationItem.titleView = self.searchView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocalListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
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
