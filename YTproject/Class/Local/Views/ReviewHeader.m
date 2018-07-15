//
//  ReviewHeader.m
//  YTproject
//
//  Created by suhuahao on 2018/7/15.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "ReviewHeader.h"
#define DefaultText  @"请输入评论内容"

@interface ReviewHeader()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *inputView;

@property (weak, nonatomic) UITextView *textView;

@end

@implementation ReviewHeader

+ (instancetype)showHeaderView{
    ReviewHeader *review = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return review;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI{
    CGFloat margin = 10;
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(margin, margin, self.inputView.width - margin*2, self.inputView.height - margin*2)];
    textView.delegate = self;
    textView.text = DefaultText;
    textView.textColor = RGB(153, 153, 153);
    textView.font = [UIFont systemFontOfSize:12.0];
    [self.inputView addSubview:textView];
    self.textView = textView;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    textView.textColor = RGB(51, 51, 51);
    textView.text = @"";
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:DefaultText] || textView.text.length <= 0) {
        textView.text = DefaultText;
        textView.textColor = RGB(153, 153, 153);
    }
    return YES;
}

- (IBAction)commit:(UIButton *)sender {
    if ([self.textView.text isEqualToString:DefaultText] || self.textView.text.length <= 0) {
        return;
    }
    if (self.delegate) {
        [self.delegate pushReviewMessage:self.textView.text];
    }
}

@end
