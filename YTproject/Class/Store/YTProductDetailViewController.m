//
//  YTProductDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTProductDetailViewController.h"
#import "ShareView.h"

@interface YTProductDetailViewController ()<ShareViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *imgBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgConstranint;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (strong, nonatomic)ShareView *shareView;

@end

@implementation YTProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.title = @"产品详情";
    CGFloat imgH = 250;
    CGFloat margin = 12;
    NSArray *imgArray = @[@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1",@"productPic1"];
    for (int i = 0; i < imgArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(margin, 40+i*imgH, kScreen_Width - 54, imgH)];
        imageView.image = [UIImage imageNamed:imgArray[i]];
        [self.imgBgView addSubview:imageView];
    }
    self.imgConstranint.constant = 60+imgArray.count*imgH;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"productNavCart"] style:UIBarButtonItemStylePlain target:self action:@selector(shoppingCar)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [[YTTool getWindow] addSubview:self.shareView];
}

- (void)shoppingCar{
    
}

- (IBAction)share:(UIButton *)sender {
    self.shareView.hidden = NO;
}
- (IBAction)add:(UIButton *)sender {
}
- (IBAction)buy:(UIButton *)sender {
}

- (void)clickCloseBtn{
    self.shareView.hidden = YES;
}

- (ShareView *)shareView{
    if (!_shareView) {
        _shareView = [[ShareView alloc]init];
        _shareView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _shareView.backgroundColor = [UIColor colorWithWhite:50.0/255.0 alpha:0.5];
        _shareView.hidden = YES;
        _shareView.delegate = self;
    }
    return _shareView;
}


@end
