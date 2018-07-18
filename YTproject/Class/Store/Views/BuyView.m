//
//  BuyView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "BuyView.h"
#import "BuyCell.h"

#define cellID @"BUYCELL"

@interface BuyView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UILabel *countLabel;

@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BuyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    CGFloat margin = 15;
    CGFloat bgH = 270;
    CGFloat collectH = 55;
    if (self.dataSorce.count > 4&&self.dataSorce.count <=8) {
        bgH = 305;
        collectH = 90;
    }else if (self.dataSorce.count > 8){
        bgH = 340;
        collectH = 125;
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(margin, self.height - bgH -5, kScreen_Width - margin * 2, bgH)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 6.0;
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setImage:[UIImage imageNamed:@"productIconClose"] forState:UIControlStateNormal];
    [deleteBtn sizeToFit];
    deleteBtn.frame = CGRectMake(bgView.width - deleteBtn.width - margin, margin, deleteBtn.width, deleteBtn.height);
    [deleteBtn addTarget:self action:@selector(clickDeleteBtn) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:deleteBtn];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"立即购买";
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    titleLabel.textColor = RGB(51, 51, 51);
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(margin, 0, titleLabel.width, titleLabel.height);
    [bgView addSubview:titleLabel];
    titleLabel.centerX = bgView.width/2;
    titleLabel.centerY = deleteBtn.centerY;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((bgView.width - 75)/4, 25);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+margin, bgView.width, collectH) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:@"BuyCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    [bgView addSubview:collectionView];
    UIImageView *productImage = [[UIImageView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(collectionView.frame)+margin, 67, 67)];
    productImage.image = [UIImage imageNamed:@"shopPic1"];
    [bgView addSubview:productImage];
    
    UILabel *productName = [[UILabel alloc]init];
    productName.text = @"红稚莲";
    [productName sizeToFit];
    productName.frame = CGRectMake(CGRectGetMaxX(productImage.frame)+margin, CGRectGetMaxY(collectionView.frame)+margin, bgView.width - margin*3 - productImage.width, productName.height);
    productName.font = [UIFont systemFontOfSize:13.0];
    productName.textColor = RGB(51, 51, 51);
    productName.numberOfLines = 0;
    productName.y = productImage.y;
    [bgView addSubview:productName];
    
    UILabel *integralLabel = [[UILabel alloc]init];
    integralLabel.text = @"1200积分";
    integralLabel.textColor = DefaultColor;
    integralLabel.font = [UIFont systemFontOfSize:12.0];
    [integralLabel sizeToFit];
    integralLabel.frame = CGRectMake(CGRectGetMaxX(productImage.frame)+margin, CGRectGetMaxY(productName.frame)+(productImage.height - productName.height - integralLabel.height), integralLabel.width, integralLabel.height);
    
    [bgView addSubview:integralLabel];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"cartBtnAdd"] forState:UIControlStateNormal];
    [addBtn sizeToFit];
    addBtn.frame = CGRectMake(bgView.width - margin - addBtn.width, 0, addBtn.width, addBtn.height);
    addBtn.centerY = integralLabel.centerY;
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:addBtn];
    
    UILabel *countLabel = [[UILabel alloc]initWithFrame:CGRectMake(bgView.width - margin - addBtn.width - 20, 0, 20, addBtn.height)];
    countLabel.textColor = RGB(102, 102, 102);
    countLabel.font = [UIFont systemFontOfSize:10];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.centerY = addBtn.centerY;
    countLabel.text = @"1";
    self.countLabel = countLabel;
    [bgView addSubview:countLabel];
    
    UIButton *reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reduceBtn setImage:[UIImage imageNamed:@"cartBtnReduce"] forState:UIControlStateNormal];
    [reduceBtn sizeToFit];
    reduceBtn.frame = CGRectMake(bgView.width - margin - addBtn.width - countLabel.width - reduceBtn.width, 0, reduceBtn.width, reduceBtn.height);
    reduceBtn.centerY = integralLabel.centerY;
    [reduceBtn addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:reduceBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(productImage.frame) + 20, bgView.width, 1)];
    line.backgroundColor = RGB(229, 229, 229);
    [bgView addSubview:line];
    
    UIButton *comfirm = [UIButton buttonWithType:UIButtonTypeCustom];
    [comfirm setBackgroundImage:[UIImage imageNamed:@"productBtnConfirm"] forState:UIControlStateNormal];
    [comfirm setTitle:@"确定" forState:UIControlStateNormal];
    
    [comfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    comfirm.titleLabel.font = [UIFont systemFontOfSize:13];
    comfirm.frame = CGRectMake(45, bgView.height - 50, bgView.width - 90, 40);
    [comfirm addTarget:self action:@selector(clickComfirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:comfirm];
    [self addSubview:bgView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BuyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleBtn.selected = YES;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    BuyCell *cell = (BuyCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleBtn.selected = NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BuyCell *cell = (BuyCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleBtn.selected = YES;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (void)add{
    NSInteger count = [self.countLabel.text integerValue];
    count++;
    self.countLabel.text = [NSString stringWithFormat:@"%zd",count];
}

- (void)reduce{
    NSInteger count = [self.countLabel.text integerValue];
    count--;
    if (count<0) {
        count = 0;
    }
    self.countLabel.text = [NSString stringWithFormat:@"%zd",count];
}

- (void)clickComfirmBtn{
    if (self.delegate) {
        [self.delegate comfirmBuy];
    }
}

- (void)clickDeleteBtn{
    if (self.delegate) {
        [self.delegate deleteBuyView];
    }
}

@end
