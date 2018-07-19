//
//  YTCartAddressViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/19.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCartAddressViewController.h"
#import "YTCartAddAddressViewController.h"
#import "AddressCell.h"

#define cellID @"addressCell"

@interface YTCartAddressViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTCartAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"选择收货地址";
    [self.tableView registerNib:[UINib nibWithNibName:@"AddressCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithTitle:@"新增" style:UIBarButtonItemStylePlain target:self action:@selector(addNew)];
    rightBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)addNew{
    YTCartAddAddressViewController *addressVc = [[YTCartAddAddressViewController alloc]init];
    [self.navigationController pushViewController:addressVc animated:YES];
}

@end
