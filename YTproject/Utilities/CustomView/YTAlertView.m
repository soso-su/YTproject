//
//  YTAlertView.m
//  YTproject
//
//  Created by suhuahao on 2018/7/25.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAlertView.h"
@interface YTAlertView ()

@property (strong ,nonatomic) UIAlertController *alertVc;
@end

@implementation YTAlertView
+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)massage style:(UIAlertControllerStyle)style cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,... {
    YTAlertView *alertView = [[YTAlertView alloc]init];
    NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:otherButtonTitles, nil];
    if (otherButtonTitles) {
        va_list arglist;
        va_start(arglist, otherButtonTitles);
        id arg;
        while((arg = va_arg(arglist, id))) {
            if (arg){
                [array addObject:arg];
            }
        }
        va_end(arglist);
    }
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:massage preferredStyle:style];
    alertView.alertVc = alertVc;
    if (cancelButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alertView buttonClickHandle:0];
        }];
        [alertVc addAction:action];
    }
    for (int i = 0; i<array.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSInteger index = [alertVc.actions indexOfObject:action];
            [alertView buttonClickHandle:index];
        }];
        [alertVc addAction:action];
    }
    return alertView;
}

- (void)buttonClickHandle:(NSInteger)index {
    if (self.buttonClickHandle) {
        self.buttonClickHandle(index);
    }
}

- (void)show {
    UIViewController *rootVc = [YTTool getRootVc];
    [rootVc presentViewController:self.alertVc animated:YES completion:nil];
}

- (void)showWithRootVc:(UIViewController *)rootVc {
    [rootVc presentViewController:self.alertVc animated:YES completion:nil];
}

- (void)dismiss {
    [self.alertVc dismissViewControllerAnimated:YES completion:nil];
}
@end
