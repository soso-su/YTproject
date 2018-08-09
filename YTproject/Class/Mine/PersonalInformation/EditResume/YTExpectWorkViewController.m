//
//  YTExpectWorkViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTExpectWorkViewController.h"
#import "YTAddressViewController.h"
#import "YTSelectWorkTypeViewController.h"
#import "YTAddStatusCertificateViewController.h"
#import "YTWorkTypeModel.h"
#import "ExpectedWorkModel.h"
#import "YTResumeViewController.h"

@interface YTExpectWorkViewController ()<UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;
@property (weak, nonatomic) IBOutlet UIButton *thisMonth;
@property (weak, nonatomic) IBOutlet UIButton *oneMonth;
@property (weak, nonatomic) IBOutlet YTTouchView *selectWorkType;
@property (weak, nonatomic) IBOutlet YTTouchView *selectAddress;
@property (weak, nonatomic) IBOutlet YTTouchView *workTypeView;
@property (weak, nonatomic) IBOutlet UITextField *workTypeTF;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *exPositionTF;
@property (strong, nonatomic) YTWorkTypeModel *typeModel;
@property (nonatomic ,strong) ExpectedWorkModel *exWorkModel;

@end

@implementation YTExpectWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑简历";
    YTWeakSelf
    self.workTypeTF.enabled = NO;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifi:) name:YTEDCATIONNOTIFICATIONNAME object:nil];
    
    self.weekBtn.selected = YES;
    self.selectWorkType.touchHandler = ^{
        [weakSelf trade];
    };
    
    self.selectAddress.touchHandler = ^{
        YTAddressViewController *vc = [[YTAddressViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        self.exWorkModel.expected_live = @"广州";
    };
    
    self.workTypeView.touchHandler = ^{
        [weakSelf.view endEditing:YES];
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"全职",@"兼职",@"实习",nil];
        alertView.buttonClickHandle = ^(NSInteger buttonIndex) {
            if (buttonIndex == 0) {
                weakSelf.workTypeTF.text = @"全职";
            }else if (buttonIndex == 1){
                weakSelf.workTypeTF.text = @"兼职";
            }else{
                weakSelf.workTypeTF.text = @"实习";
            }
            weakSelf.exWorkModel.expected_type = buttonIndex;
        };
        [alertView show];
    };
}

- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)notifi:(NSNotification *)info{
    YTLog(@"%@",info.userInfo[@"test"]);
    self.exWorkModel.expected_trade = 1;
}

- (IBAction)onWeek:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.thisMonth.selected = NO;
        self.oneMonth.selected = NO;
    }
    self.exWorkModel.on_position = 0;
}

- (IBAction)onMonth:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.weekBtn.selected = NO;
        self.oneMonth.selected = NO;
    }
    self.exWorkModel.on_position = 1;
}

- (IBAction)oneMonth:(UIButton *)sender {
    sender.selected = YES;
    if (sender.selected) {
        self.thisMonth.selected = NO;
        self.weekBtn.selected = NO;
    }
    self.exWorkModel.on_position = 2;
}
- (IBAction)next:(UIButton *)sender {
    NSDictionary *dict = @{
                           @"expected_position":YTReplaceNil(self.exWorkModel.expected_position),
                           @"expected_type":@(self.exWorkModel.expected_type),
                           @"expected_trade":@(self.exWorkModel.expected_trade),
                           @"expected_live":YTReplaceNil(self.exWorkModel.expected_live),
                           @"expected_supplement":YTReplaceNil(self.exWorkModel.expected_supplement),
                           @"on_position":@(self.exWorkModel.on_position)
                           };
    [self addExpectWorkWithDict:dict];
    
}

- (YTWorkTypeModel *)typeModel{
    if (!_typeModel) {
        _typeModel = [[YTWorkTypeModel alloc]init];
    }
    return _typeModel;
}

- (ExpectedWorkModel *)exWorkModel{
    if (!_exWorkModel) {
        _exWorkModel = [[ExpectedWorkModel alloc]init];
    }
    return _exWorkModel;
}

#pragma mark -----------------------UITextViewDelegate,UITextFieldDelegate-----------------

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length > 0) {
        self.exWorkModel.expected_supplement = textView.text;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length > 0) {
        self.exWorkModel.expected_position = textField.text;
    }
}

#pragma mark -----------------------Http-----------------------------------------

- (void)addExpectWorkWithDict:(NSDictionary *)dict{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTEditResume requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:@"添加成功"];
                YTAddStatusCertificateViewController *vc = [[YTAddStatusCertificateViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"editResume error = %@",error);
    }];
}


- (void)trade{
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTTradeUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        YTLog(@"responseObject = %@",responseObject);
        @try {
            weakSelf.typeModel.assortmentList = [NSArray yy_modelArrayWithClass:[AssortmentList class] json:responseObject[@"assortmentList"]];
            YTSelectWorkTypeViewController *vc = [[YTSelectWorkTypeViewController alloc]init];
            vc.typeModel = weakSelf.typeModel;
            vc.title = @"期望行业";
            [weakSelf.navigationController pushViewController:vc animated:YES];
        } @catch (NSException *exception) {
            YTLog(@"YTTradeUrl exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        
        YTLog(@"YTTradeUrl error = %@",error);
    }];
}


@end
