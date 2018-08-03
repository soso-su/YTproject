//
//  YTWorkDetailViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkDetailViewController.h"
#import "YTCompanyViewController.h"
#import "YTPostFileViewController.h"
#import "YTChatViewController.h"
#import "CustomButton.h"
#import "ShareView.h"
#import "PositionDetailModel.h"

@interface YTWorkDetailViewController ()<ShareViewDelegate>
@property (weak, nonatomic) IBOutlet YTTouchView *companyView;
@property (strong, nonatomic)ShareView *shareView;
@property (weak, nonatomic) IBOutlet CustomButton *shareBtn;
@property (weak, nonatomic) IBOutlet CustomButton *interestsBtn;
//
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *issueTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *workTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recruitCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;

//
@property (weak, nonatomic) IBOutlet UIImageView *companyLogo;
@property (weak, nonatomic) IBOutlet UILabel *companyNabelLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyAreaLabel;

//
@property (weak, nonatomic) IBOutlet UILabel *positionMsgLabel;


@end

@implementation YTWorkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self positionDetailWith:self.positionId];
    [self setNav];
    self.title = @"职业详情";
    self.shareBtn.customButtonType = ImageUpLabelDown;
    self.interestsBtn.customButtonType = ImageUpLabelDown;
    [[YTTool getWindow] addSubview:self.shareView];
    
    self.companyView.touchHandler = ^{
        YTCompanyViewController *companyVc = [[YTCompanyViewController alloc]init];
        [self.navigationController pushViewController:companyVc animated:YES];
    };
}

- (void)setUIwithModel:(PositionDetailModel *)model{
    self.positionLabel.text = model.position_name;
    self.areaLabel.text = [NSString stringWithFormat:@"%@|%zd年|%@",model.area,model.work_life,model.education];
    self.moneyLabel.text = [NSString stringWithFormat:@"%zdk-%zdk",model.hight_money,model.low_money];
    self.issueTimeLabel.text = model.created_time;
    self.workTimeLabel.text = [NSString stringWithFormat:@"工作时间：%@",model.work_time];
    self.recruitCountLabel.text = [NSString stringWithFormat:@"招聘人数：%zd人",model.num];
    self.languageLabel.text = [NSString stringWithFormat:@"语言：%@",model.language];
    
    [self.companyLogo sd_setImageWithURL:[NSURL URLWithString:model.avatar_url] placeholderImage:[UIImage imageNamed:@"gsxqPic1"]];
    self.companyNabelLabel.text = model.abbreviation;
    self.companyAreaLabel.text = [NSString stringWithFormat:@"%@  D轮  %@  ",model.address,model.number];
    
    self.companyView.touchHandler = ^{
        YTCompanyViewController *companyVc = [[YTCompanyViewController alloc]init];
        companyVc.companyId = model.c_id;
        [self.navigationController pushViewController:companyVc animated:YES];
    };
}


- (void)setNav{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navCollect"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navCollectPre"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 35, 35);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)clickRightButton:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)clickCloseBtn{
    self.shareView.hidden = YES;
}

- (IBAction)share:(CustomButton *)sender {
    self.shareView.hidden = NO;
}

- (IBAction)interest:(CustomButton *)sender {
}
- (IBAction)sendFile:(UIButton *)sender {
    [self sendResume];
    YTPostFileViewController *fileVc = [[YTPostFileViewController alloc]init];
    [self.navigationController pushViewController:fileVc animated:YES];
}
- (IBAction)callhr:(UIButton *)sender {
    YTChatViewController *chat = [[YTChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
                                                                               targetId:@"yt2"];
    chat.title = @"马蜂窝hr-Amy";
    chat.conversationType = ConversationType_PRIVATE;
    chat.targetId = @"yt2";
    [self.navigationController pushViewController:chat animated:YES];
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

#pragma mark --------------Http---------------------


/**
 职位详情接口

 @param positionId 职位ID
 */
- (void)positionDetailWith:(NSInteger)positionId{
    NSDictionary *dic = @{@"id":@(positionId)};
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTPositionDetailUrl requestType:RequestType_post parameters:dic success:^(id responseObject) {
        YTLog(@"responseObject = %@",responseObject);
        @try {
            [YTProgressHUD dismissHUD];
            PositionDetailModel *model = [PositionDetailModel yy_modelWithJSON:responseObject[@"position"]];
            [weakSelf setUIwithModel:model];
        } @catch (NSException *exception) {
            [YTProgressHUD dismissHUD];
            YTLog(@"positionDetail exception = %@",exception.description);
        }
        
    } failure:^(NSError *error) {
        [YTProgressHUD dismissHUD];
        YTLog(@"error = %@",error);
    }];
}

- (void)sendResume{
    [YTHttpTool requestWithUrlStr:YTSendResumeUrl requestType:RequestType_post parameters:nil success:^(id responseObject) {
        @try {
            YTLog(@"responseObject = %@",responseObject);
        } @catch (NSException *exception) {
            YTLog(@"exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        YTLog(@"error = %@",error);
    }];
}


@end
