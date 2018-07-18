//
//  YTResumeViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTResumeViewController.h"
#import "YTResumeHeaderTableViewCell.h"
#import "YTResumeVideoTableViewCell.h"

@interface YTResumeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

-(void)injected{
    [self.tableView reloadData];
}

#pragma mark =======================UITableViewDataSource=========================
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger sectionIndex = indexPath.section;
    
    if (sectionIndex == 0) {
        YTResumeHeaderTableViewCell *headerCell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeHeaderTableViewCell class]) owner:self options:nil].lastObject;
        
        return headerCell;
    }
    
    if (sectionIndex == 1){
        YTResumeVideoTableViewCell *videoVc = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTResumeVideoTableViewCell class]) owner:self options:nil].lastObject;
        
        return  videoVc;
    }
    
    return [[UITableViewCell alloc]init];
}

#pragma mark =======================UITableViewDelegate=========================
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

#pragma mark =======================Setup=========================
- (void)setupView{

}

@end
