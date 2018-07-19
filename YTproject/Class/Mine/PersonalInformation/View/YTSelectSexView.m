//
//  SelectSexView.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSelectSexView.h"

@interface YTSelectSexView()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *boyButton;
@property (weak, nonatomic) IBOutlet UIButton *girlButton;

@property (nonatomic,strong)SelectedBlock selectedBlock;

@end

@implementation YTSelectSexView

+(void)showWithDefaultSelectIndex:(SexType)sexType SelectBlock:(SelectedBlock)block{
    YTSelectSexView *selectSexView = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTSelectSexView class]) owner:self options:nil].lastObject;
    selectSexView.selectedBlock = block;
    selectSexView.sexType = sexType;
    selectSexView.frame = [UIScreen mainScreen].bounds;
    selectSexView.alpha = 0;
    
    [[[UIApplication sharedApplication]keyWindow]addSubview:selectSexView];
    
    [UIView animateWithDuration:0.3 animations:^{
        selectSexView.alpha = 1;
    }];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.backgroundView addGestureRecognizer:tap];
}

-(void)dismiss{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)boy:(UIButton *)sender {
    self.sexType = Boy;
}

- (IBAction)girl:(UIButton *)sender {
    self.sexType = Girl;
}

- (IBAction)ensure:(UIButton *)sender {
    self.selectedBlock(self.sexType);
    [self dismiss];
}

- (IBAction)cancel:(UIButton *)sender {
    [self dismiss];
}

- (void)setSexType:(SexType)sexType{
    _sexType = sexType;
    self.boyButton.selected = sexType == Boy;
    self.girlButton.selected = sexType != Boy;
}

@end
