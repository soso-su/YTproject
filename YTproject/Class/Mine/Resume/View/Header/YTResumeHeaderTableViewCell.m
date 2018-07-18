//
//  YTResumeHeaderTableViewCell.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTResumeHeaderTableViewCell.h"
#import "YTMedalCollectionViewCell.h"

@interface YTResumeHeaderTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

static NSString *const MedalCollectionViewCellId = @"medalCollectionViewCellId";

@implementation YTResumeHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YTMedalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:MedalCollectionViewCellId];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark =======================UICollectionViewDataSource=========================
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YTMedalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MedalCollectionViewCellId forIndexPath:indexPath];
    cell.medalLabel.text = @"勋章";
    
    return  cell;
}

@end
