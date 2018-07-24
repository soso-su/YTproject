//
//  YTSearchView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/24.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTSearchView.h"

@interface YTSearchView()<UITextFieldDelegate>

@property (weak, nonatomic)UITextField *textField;

@property (weak, nonatomic)UIImageView *searchImage;

@end

@implementation YTSearchView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat top = 2;
    self.searchImage.frame = CGRectMake(self.width - self.searchImage.width - margin, 0, self.searchImage.width, self.searchImage.height);
    self.searchImage.centerY = self.height/2;
    
    self.textField.frame = CGRectMake(margin, top, self.width - self.searchImage.width - margin*2, self.height-top*2);
    
}

- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 6.0;
    UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchIcon1"]];
    [self addSubview:searchImage];
    self.searchImage = searchImage;
    
    UITextField *textField = [[UITextField alloc]init];
    textField.delegate = self;
    textField.returnKeyType = UIReturnKeySearch;
    textField.font = [UIFont systemFontOfSize:12.0];
    textField.textColor = RGB(51, 51, 51);
    [self addSubview:textField];
    self.textField = textField;
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

- (void)setText:(NSString *)text{
    _text = text;
    self.textField.text = text;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.delegate) {
        [self.delegate searchTextFieldDidBeginEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.delegate) {
        [self.delegate searchTextFieldDidEndEditing:textField];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.delegate) {
        return [self.delegate searchTextFieldShouldReturn:textField];
    }
    return YES;
}

@end
