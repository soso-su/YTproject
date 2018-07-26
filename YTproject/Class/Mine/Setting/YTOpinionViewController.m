//
//  YTOpinionViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTOpinionViewController.h"

@interface YTOpinionViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation YTOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.text = @"";
    textView.textColor = RGB(51, 51, 51);
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length > 0 && ![textView.text isEqualToString:@"您想提出的建议..."]) {
        
    }else{
        textView.textColor = RGB(153, 153, 153);
        textView.text = @"您想提出的建议...";
    }
}


@end
