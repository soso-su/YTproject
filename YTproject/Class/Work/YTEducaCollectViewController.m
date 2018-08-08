//
//  YTEducaCollectViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/12.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEducaCollectViewController.h"
#import "YTEdViewCell.h"

#define cellId @"YTEdViewCell"
#define headID @"ythead"

@interface YTEducaCollectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation YTEducaCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake((kScreen_Width - 105)/4, 30);
    flayout.minimumInteritemSpacing = 8;
    flayout.minimumLineSpacing = 8;
    
    
    [self.collectionView setCollectionViewLayout:flayout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"YTEdViewCell" bundle:nil] forCellWithReuseIdentifier:cellId];
    self.collectionView.backgroundColor = RGB(238, 238, 238);
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    self.collectionView.autoresizingMask = NO;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self trade];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.type == 100) {
        return 1;
    }
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YTEdViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (self.type == 100) {
        cell.titleLabel.text = @"市场营销";
    }else if(self.type == 0){
        if (indexPath.section == 0) {
            cell.titleLabel.text = @"英语";
        }else if (indexPath.section == 1){
            cell.titleLabel.text = @"小学";
        }else{
            cell.titleLabel.text = @"公立";
        }
    }else if(self.type == 1){
        if (indexPath.section == 0) {
            cell.titleLabel.text = @"音乐";
        }else if (indexPath.section == 1){
            cell.titleLabel.text = @"小学";
        }else{
            cell.titleLabel.text = @"公立";
        }
    }else if (self.type == 2){
        if (indexPath.section == 0) {
            cell.titleLabel.text = @"IELTS";
        }else if (indexPath.section == 1){
            cell.titleLabel.text = @"小学";
        }else{
            cell.titleLabel.text = @"公立";
        }
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headID forIndexPath:indexPath];
        header.backgroundColor = [UIColor whiteColor];
        if (header.subviews.lastObject!=nil) {
            [header.subviews.lastObject removeFromSuperview];
        }
        if (self.type == 100) {
            return header;
        }else{
            if (indexPath.section != 0) {
                
                UILabel *titleLabel = [[UILabel alloc]init];
                titleLabel.textColor = RGB(51, 51, 51);
                titleLabel.font = [UIFont systemFontOfSize:15.0];
                if (indexPath.section == 1) {
                    titleLabel.text = @"学生年龄";
                }else{
                    titleLabel.text = @"学校性质";
                }
                
                [titleLabel sizeToFit];
                titleLabel.frame = CGRectMake(0, 0, titleLabel.width, titleLabel.height);
                titleLabel.centerY = header.height/2;
                [header addSubview:titleLabel];
                return header;
            }
        }
            return nil;
    }else if (kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor whiteColor];
        if (footer.subviews.lastObject!=nil) {
            [footer.subviews.lastObject removeFromSuperview];
        }
        if (indexPath.section == 2) {
            return footer;
        }else
            return nil;
    }
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.type == 100) {
        return CGSizeMake(kScreen_Width - 30, 20);;
    }else{
        if (section != 0) {
            return CGSizeMake(kScreen_Width - 30, 50);
        }
    }
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(kScreen_Width - 30, 150);
    }
    return CGSizeMake(0, 0);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [[NSNotificationCenter defaultCenter] postNotificationName:YTEDCATIONNOTIFICATIONNAME object:self userInfo:@{@"test":@"11111111"}];
}

#pragma mark ------------------Http----------------------

- (void)trade{
    [YTHttpTool requestWithUrlStr:YTTradeUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        YTLog(@"responseObject = %@",responseObject);
    } failure:^(NSError *error) {
        
        YTLog(@"findPosition error = %@",error);
    }];
}

@end
