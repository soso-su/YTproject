//
//  SelectTypeView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "SelectTypeView.h"
#import "SelectTypeCell.h"

#define cellID @"TypeCell"

@interface SelectTypeView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *dataSorce;

@end

@implementation SelectTypeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *alpView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, kScreen_Width, self.height)];
        alpView.backgroundColor = [UIColor colorWithWhite:120/255.0 alpha:0.5];
        [self addSubview:alpView];
    }
    return self;
}

- (void)setRect:(CGRect)rect{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(rect.origin.x, 0, rect.size.width, 30*self.dataSorce.count) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.layer.cornerRadius = 4.0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    self.tableView = tableView;
    
    [tableView registerNib:[UINib nibWithNibName:@"SelectTypeCell" bundle:nil] forCellReuseIdentifier:cellID];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSorce.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.titleLabel.text = self.dataSorce[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.callback(self.dataSorce[indexPath.row]);
}

- (NSArray *)dataSorce{
    if (!_dataSorce) {
        _dataSorce = @[@"全部",@"全职",@"兼职",@"实习",@"英途认证",@"可提供工签"];
    }
    return _dataSorce;
}

@end
