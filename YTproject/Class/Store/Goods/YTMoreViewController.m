//
//  YTMoreViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTMoreViewController.h"
#import "MoreCell.h"

#define cellID  @"moreCell"

@interface YTMoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceAscendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceDescendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesAscendingBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesDescendingBtn;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation YTMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"MoreCell" bundle:nil] forCellReuseIdentifier:cellID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}


- (IBAction)priceAscending:(UIButton *)sender {
}
- (IBAction)priceDescendingBtn:(UIButton *)sender {
}

- (IBAction)salesAscending:(UIButton *)sender {
}

- (IBAction)salesDescending:(UIButton *)sender {
}


@end
