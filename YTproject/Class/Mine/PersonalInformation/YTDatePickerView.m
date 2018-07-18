//
//  YTDatePickerView.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTDatePickerView.h"

@interface YTDatePickerView ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic,strong)DateSelectedBlock selectedBlock;
@property (nonatomic,strong)NSDate *defaultDate;

@end

@implementation YTDatePickerView

+(void)showWithDefaultSelectDate:(NSDate *)date SelectBlock:(DateSelectedBlock)block{
    YTDatePickerView *view = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YTDatePickerView class]) owner:self options:nil].lastObject;
    view.selectedBlock = block;
    view.defaultDate = date;
    view.frame = [UIScreen mainScreen].bounds;
    view.alpha = 0;
    
    [[[UIApplication sharedApplication]keyWindow]addSubview:view];
    
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1;
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

- (IBAction)ensure:(UIButton *)sender {
    
    self.selectedBlock(self.datePicker.date);
    [self dismiss];
}

- (IBAction)cancel:(UIButton *)sender {
    [self dismiss];
}

- (void)setDefaultDate:(NSDate *)defaultDate{
    _defaultDate = defaultDate;
    
    self.datePicker.date = defaultDate;
}

@end
