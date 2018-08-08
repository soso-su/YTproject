//
//  YTCompanyViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTCompanyViewController.h"
#import "CustomButton.h"
#import <SGPagingView.h>
#import "YTCompanyMessageController.h"
#import "YTWorkSearchTableViewController.h"
#import "CompanyModel.h"
#import "YTMapViewController.h"
#import "YTApproveDetailViewController.h"
#import "PositionModel.h"

@interface YTCompanyViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>

//@property (nonatomic, weak)UIScrollView *scrollView;
//
//@property (nonatomic, weak)UIView *bgView;

@property (nonatomic, weak)UIImageView *companyLogo;

@property (nonatomic, weak)UILabel *companyName;

@property (nonatomic, weak)UILabel *companyCount;

@property (nonatomic, weak)CustomButton *companyAddress;

@property (nonatomic, weak)YTTouchView *attestationVie;

@property (nonatomic ,strong) CompanyModel *companyModel;

@property (nonatomic, strong) NSMutableArray <PositionModel *>*positionList;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;

@property (nonatomic ,strong) YTCompanyMessageController *messageVc;
@property (nonatomic ,strong) YTWorkSearchTableViewController *tableVc;



@end

@implementation YTCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self companyDetailWithCompanyId:self.companyId];
}

- (void)setUpUI{
    CGFloat left = 15;
    CGFloat top = 12;
    CGFloat logoH = 62;
    CGFloat headH = 176;
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    self.title = @"公司详情";
    YTWeakSelf
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, self.view.height)];
//    [self.view addSubview:scrollView];
//    self.scrollView = scrollView;
//    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, self.view.height)];
//    [scrollView addSubview:bgView];
//    self.bgView = bgView;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, headH)];
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    
    UIImageView *companyLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gsxqPic1"]];
    companyLogo.frame = CGRectMake(left, top, logoH, logoH);
    [headView addSubview:companyLogo];
    self.companyLogo = companyLogo;
    
    UILabel *companyName = [[UILabel alloc]init];
    companyName.text = @"马蜂窝";
    companyName.textColor = RGB(51, 51, 51);
    companyName.font = [UIFont systemFontOfSize:14.0];
    [companyName sizeToFit];
    companyName.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+top, top, companyName.width, companyName.height);
    [headView addSubview:companyName];
    self.companyName = companyName;
    
    UILabel *companyCount = [[UILabel alloc]init];
    companyCount.textColor = RGB(102, 102, 102);
    companyCount.font = [UIFont systemFontOfSize:11.0];
    companyCount.text = @"1000-2000人   互联网";
    [companyCount sizeToFit];
    companyCount.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+top, CGRectGetMaxY(companyName.frame)+indicatorWidth, companyCount.width, companyCount.height);
    [headView addSubview:companyCount];
    self.companyCount = companyCount;
    
    CustomButton *companyAddress = [CustomButton buttonWithType:UIButtonTypeCustom];
    companyAddress.customButtonType = 1;
    [companyAddress setTitle:@"广州" forState:UIControlStateNormal];
    [companyAddress setImage:[UIImage imageNamed:@"gsxqIconLocation"] forState:UIControlStateNormal];
    [companyAddress setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
    companyAddress.titleLabel.font = [UIFont systemFontOfSize:11.0];
    [companyAddress sizeToFit];
    companyAddress.frame = CGRectMake(CGRectGetMaxX(companyLogo.frame)+5, CGRectGetMaxY(companyCount.frame)+indicatorWidth, companyAddress.width+15, companyAddress.height);
    [headView addSubview:companyAddress];
    
    [[companyAddress rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YTMapViewController *vc = [[YTMapViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    self.companyAddress = companyAddress;
    
    YTTouchView *attestationView = [[YTTouchView alloc]initWithFrame:CGRectMake(left, CGRectGetMaxY(companyLogo.frame)+28, logoH, logoH)];
    UIImageView *attestationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gsxqIcon1"]];
    attestationImage.frame = CGRectMake(left, 0, 36, 36);
    [attestationView addSubview:attestationImage];
    
    UILabel *attestationTitle = [[UILabel alloc]init];
    attestationTitle.text = @"企业认证";
    attestationTitle.font = [UIFont systemFontOfSize:11];
    attestationTitle.textColor = RGB(102, 102, 102);
    [attestationTitle sizeToFit];
    attestationTitle.frame = CGRectMake(0, CGRectGetMaxY(attestationImage.frame)+indicatorWidth, attestationTitle.width, attestationTitle.height);
    attestationTitle.centerX = attestationImage.centerX;
    [attestationView addSubview:attestationTitle];
    
    attestationView.touchHandler = ^{
        YTApproveDetailViewController *vc = [[YTApproveDetailViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    [headView addSubview:attestationView];
    
    
    UIView *underView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headView.frame)+indicatorWidth, kScreen_Width, self.view.height - headView.height - indicatorWidth)];
    underView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:underView];
    
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = RGB(255, 67, 67);
    configure.indicatorColor = RGB(255, 67, 67);
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, kScreen_Width, titleViewH) delegate:self titleNames:@[@"基本信息",@"招聘职位"] configure:configure];
    self.pageTitleView.selectedIndex = 0;
    [underView addSubview:self.pageTitleView];
    
    self.messageVc = [[YTCompanyMessageController alloc]init];
    self.tableVc = [[YTWorkSearchTableViewController alloc]init];
    self.tableVc.positionList = self.positionList;
    self.tableVc.type = 100;
    NSArray *vcs = @[self.messageVc,self.tableVc];
    
    CGFloat contentViewHeight = kScreen_Height - headH - indicatorWidth - titleViewH - self.stateBarAndNavBarHeight;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, titleViewH, kScreen_Width, contentViewHeight) parentVC:self childVCs:vcs];
    self.pageContentView.delegatePageContentScrollView = self;
    [underView addSubview:self.pageContentView];
    
}

- (void)setUpUIwithData:(CompanyModel *)model{
    [self.companyLogo sd_setImageWithURL:[NSURL URLWithString:model.avatar_url] placeholderImage:[UIImage imageNamed:@"gsxqPic1"]];
    self.companyName.text = model.company_name;
    self.companyCount.text = [NSString stringWithFormat:@"%zd人",model.number];
}


- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    self.tableVc.positionList = self.positionList;
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    self.tableVc.positionList = self.positionList;
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (NSMutableArray <PositionModel *>*)positionList{
    if (!_positionList) {
        _positionList = [NSMutableArray array];
    }
    return _positionList;
}


#pragma mark ----------------Http--------------

- (void)companyDetailWithCompanyId:(NSInteger)companyId{
    NSDictionary *dic = @{
                          @"id":@(companyId)
                          };
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTCompanyDetailUrl requestType:RequestType_post parameters:dic success:^(id responseObject) {
        @try {
            [YTProgressHUD dismissHUD];
            YTLog(@"responseObject = %@",responseObject);
            weakSelf.companyModel = [CompanyModel yy_modelWithJSON:responseObject[@"company"]];
            [weakSelf setUpUIwithData:weakSelf.companyModel];
            NSArray *positionArr = responseObject[@"positionList"];
            NSMutableArray *positionList = [NSMutableArray array];
            if (positionArr.count > 0) {
                for (NSDictionary *dic in positionArr) {
                    PositionModel *model = [PositionModel yy_modelWithJSON:dic];
                    [positionList addObject:model];
                }
            }
            weakSelf.positionList = positionList;
            
        } @catch (NSException *exception) {
            [YTProgressHUD dismissHUD];
            YTLog(@"companyDetail exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD dismissHUD];
        YTLog(@"companyDetail error = %@",error);
    }];
}



@end
