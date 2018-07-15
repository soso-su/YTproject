//
//  ReviewViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/15.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ReviewViewController.h"
#import "ReviewCell.h"
#define cellID @"reviewCell"
#import "ReviewHeader.h"
#import "ReviewModel.h"

@interface ReviewViewController ()<UITableViewDelegate,UITableViewDataSource,ReviewHeaderDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)NSMutableArray <ReviewModel *>*dataSource;

@end

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"评论";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"ReviewCell" bundle:nil] forCellReuseIdentifier:cellID];
    ReviewHeader *review = [ReviewHeader showHeaderView];
    review.delegate = self;
    self.tableView.tableHeaderView = review;
    
}

- (void)setData{
    ReviewModel *model = [[ReviewModel alloc]init];
    model.msg = @"气氛很好";
    model.userName = @"李*琪";
    model.imageName = @"commentPic";
    [self.dataSource addObject:model];
    
    ReviewModel *model1 = [[ReviewModel alloc]init];
    model1.msg = @"确实不错";
    model1.userName = @"李*琪";
    model1.imageName = @"commentPic";
    [self.dataSource addObject:model1];
    
}

- (void)pushReviewMessage:(NSString *)msg{
    ReviewModel *model = [[ReviewModel alloc]init];
    model.msg = msg;
    model.userName = @"李*琪";
    model.imageName = @"commentPic";
    [self.dataSource addObject:model];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (NSMutableArray <ReviewModel *>*)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

@end
