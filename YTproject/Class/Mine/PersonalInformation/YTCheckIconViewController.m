//
//  YTCheckIconViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCheckIconViewController.h"

@interface YTCheckIconViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (nonatomic,strong)UIImage *iconImage;

@end

@implementation YTCheckIconViewController

-(instancetype)initWithIcon:(UIImage *)icon{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.iconImage = icon;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"查看头像";
    self.iconImageView.image = self.iconImage;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"更换" style:UIBarButtonItemStylePlain target:self action:@selector(changeIcon)];
    rightItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.backBarButtonItem.title = @"";
}

- (void)changeIcon{
    
}


@end
