//
//  YTWorkSearchViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/6.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTWorkSearchViewController.h"
#import <SGPagingView.h>
#import "SelectEducationView.h"
#import "YTWorkSearchTableViewController.h"
#import "CustomButton.h"
#import "SelectTypeView.h"
#import "CPSearchListViewController.h"
#import "PositionModel.h"

@interface YTWorkSearchViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate,UITextFieldDelegate>

@property (nonatomic, weak)UIButton *selectWorkBtn;

@property (nonatomic, weak)UIView *mainView;
@property (nonatomic, weak)UIView *otherView;

@property (nonatomic, weak)SelectEducationView *educationView;
@property (strong, nonatomic) NSArray *titleArray;
@property (nonatomic, weak)UITextField *searchTF;

@property (nonatomic, weak)CustomButton *typeBtn;

@property (nonatomic, strong)SelectTypeView *tyView;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentView;


@property (nonatomic ,strong) NSMutableArray <PositionModel *>*positionList;

@property (nonatomic ,strong) YTWorkSearchTableViewController *vc;

@property (nonatomic ,strong) YTWorkSearchTableViewController *vc1;

@property (nonatomic ,strong) YTWorkSearchTableViewController *vc2;

@property (nonatomic ,strong) YTWorkSearchTableViewController *vc3;

@property (nonatomic ,strong) YTWorkSearchTableViewController *vc4;

@end

@implementation YTWorkSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNotification];
    [self setNav];
    [self setUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self findPositionWithKey:self.searchText pageNumber:1];
}

- (void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:YTEDCATIONNOTIFICATIONNAME object:nil];
}

- (void)setNav{
    if (!self.isCompany) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button sizeToFit];
        [button setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
        button.size = CGSizeMake(50, 30);
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        [button setTitle:@"广州" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancleButton.frame = CGRectMake(0, 0, 40, 35);
    [cancleButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    
    UIView *tiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width - 50 - cancleButton.width - 40, 30)];
    tiView.backgroundColor = [UIColor whiteColor];
    tiView.layer.cornerRadius = 4.0;
    self.navigationItem.titleView = tiView;
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setImage:[UIImage imageNamed:@"searchIcon1"] forState:UIControlStateNormal];
    [searchBtn sizeToFit];
    searchBtn.frame = CGRectMake(tiView.width - searchBtn.width - 15, 0, searchBtn.width, tiView.height);
    [tiView addSubview:searchBtn];
    
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, tiView.width - searchBtn.width - 30, tiView.height)];
    searchTF.font = [UIFont systemFontOfSize:13.0];
    searchTF.textColor = RGB(51, 51, 51);
    searchTF.text = self.searchText;
    searchTF.returnKeyType = UIReturnKeySearch;
    searchTF.delegate = self;
    [tiView addSubview:searchTF];
    self.searchTF = searchTF;
}

- (void)setUI{
    CGFloat tyViewH = 40;
    CGFloat margin = 15;
    CGFloat titleViewH = 44;
    CGFloat indicatorWidth = 10;
    self.view.backgroundColor = RGB(238, 238, 238);
    UIView *tyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, tyViewH)];
    tyView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tyView];
    
    UILabel *workType = [[UILabel alloc]init];
    workType.text = @"行业：";
    workType.textColor = RGB(51, 51, 51);
    workType.font = [UIFont systemFontOfSize:13.0];
    [workType sizeToFit];
    workType.frame = CGRectMake(margin, margin, workType.width, workType.height);
    [tyView addSubview:workType];
    
    
    UIButton *selectWorkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectWorkBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    selectWorkBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [selectWorkBtn setTitle:@"教育>语言>英语" forState:UIControlStateNormal];
    [selectWorkBtn sizeToFit];
    selectWorkBtn.frame = CGRectMake(CGRectGetMaxX(workType.frame), 0, selectWorkBtn.width, selectWorkBtn.height);
    selectWorkBtn.centerY = workType.centerY;
    [selectWorkBtn addTarget:self action:@selector(selectWork:) forControlEvents:UIControlEventTouchUpInside];
    [tyView addSubview:selectWorkBtn];
    self.selectWorkBtn = selectWorkBtn;
    
    
    SelectEducationView *educationView = [[SelectEducationView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tyView.frame), kScreen_Width, kScreen_Height - tyView.height)];
    educationView.controller = self;
    educationView.hidden = YES;
    self.educationView = educationView;
    [self.view addSubview:educationView];
    
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tyView.frame), kScreen_Width, kScreen_Height - tyView.height)];
    mainView.backgroundColor = RGB(238, 238, 238);
    self.mainView = mainView;
    [self.view addSubview:mainView];
    
    UIView *otherView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 95)];
    otherView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:otherView];
    self.otherView = otherView;
    
    
    UILabel *typeLabel = [[UILabel alloc]init];
    typeLabel.text = @"类型：";
    typeLabel.textColor = RGB(51, 51, 51);
    typeLabel.font = [UIFont systemFontOfSize:13.0];
    [typeLabel sizeToFit];
    typeLabel.frame = CGRectMake(margin, margin, typeLabel.width, typeLabel.height);
    [otherView addSubview:typeLabel];
    
    
    CustomButton *typeBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    typeBtn.fontSize = 13.0;
    typeBtn.customButtonType = LabelLeftImageRight;
    typeBtn.backgroundColor = RGB(238, 238, 238);
    typeBtn.layer.cornerRadius = 4.0;
    [typeBtn setTitle:@"全职" forState:UIControlStateNormal];
    typeBtn.frame = CGRectMake(CGRectGetMaxX(typeLabel.frame), 0, 140, 25);
    [typeBtn setImage:[UIImage imageNamed:@"searchIcon3"] forState:UIControlStateNormal];
    [typeBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    typeBtn.centerY = typeLabel.centerY;
    [otherView addSubview:typeBtn];
    self.typeBtn = typeBtn;
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = RGB(102, 102, 102);
    configure.titleSelectedColor = DefaultColor;
    configure.indicatorColor = DefaultColor;
    configure.indicatorHeight = 2.0;
    configure.showBottomSeparator = NO;
    configure.indicatorAdditionalWidth = indicatorWidth;

    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, CGRectGetMaxY(typeBtn.frame) + margin, kScreen_Width, titleViewH) delegate:self titleNames:self.titleArray configure:configure];
    self.pageTitleView.selectedIndex = 0;
    [otherView addSubview:self.pageTitleView];
    NSArray *controlArray = [NSArray array];
    if (self.isCompany) {
        CPSearchListViewController *vc = [[CPSearchListViewController alloc]init];
        CPSearchListViewController *vc1 = [[CPSearchListViewController alloc]init];
        CPSearchListViewController *vc2 = [[CPSearchListViewController alloc]init];
        controlArray = @[vc,vc1,vc2];
    }else{
        self.vc = [[YTWorkSearchTableViewController alloc]init];
        self.vc1 = [[YTWorkSearchTableViewController alloc]init];
        self.vc2 = [[YTWorkSearchTableViewController alloc]init];
        self.vc3 = [[YTWorkSearchTableViewController alloc]init];
        self.vc4 = [[YTWorkSearchTableViewController alloc]init];
        controlArray = @[self.vc,self.vc1,self.vc2,self.vc3,self.vc4];
    }
    
    CGFloat contentViewHeight = kScreen_Height - tyView.height - otherView.height - self.stateBarAndNavBarHeight - indicatorWidth;
    self.pageContentView = [[SGPageContentScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(otherView.frame) + indicatorWidth, kScreen_Width, contentViewHeight) parentVC:self childVCs:controlArray];
    self.pageContentView.delegatePageContentScrollView = self;
    [mainView addSubview:self.pageContentView];
    
    self.tyView.rect = self.typeBtn.frame;
    [self.view addSubview:self.tyView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    self.vc.positionList = self.positionList;
    self.vc1.positionList = self.positionList;
    self.vc2.positionList = self.positionList;
    self.vc3.positionList = self.positionList;
    self.vc4.positionList = self.positionList;
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    self.vc.positionList = self.positionList;
    self.vc1.positionList = self.positionList;
    self.vc2.positionList = self.positionList;
    self.vc3.positionList = self.positionList;
    self.vc4.positionList = self.positionList;
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self findPositionWithKey:textField.text pageNumber:1];
    return YES;
}

- (void)selectWork:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.tyView.hidden = YES;
    if (sender.selected) {
        self.educationView.hidden = NO;
        self.mainView.hidden = YES;
    }else{
        self.educationView.hidden = YES;
        self.mainView.hidden = NO;
    }
}

- (void)selectType:(CustomButton *)button{
    self.tyView.hidden = !self.tyView.hidden;
    YTWeakSelf
    self.tyView.callback = ^(NSString *str) {
        if (str.length > 0 && ![button.titleLabel.text isEqualToString:str]) {
            [button setTitle:str forState:UIControlStateNormal];
            weakSelf.tyView.hidden = YES;
        }
    };
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getNotification:(NSNotification*)notification{
    YTLog(@"no =========%@",notification.userInfo[@"test"]);
    self.educationView.hidden = YES;
    self.mainView.hidden = NO;
}


- (SelectTypeView *)tyView{
    if (!_tyView) {
        _tyView = [[SelectTypeView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.typeBtn.frame)+self.stateBarAndNavBarHeight, kScreen_Width, kScreen_Height - CGRectGetMaxY(self.typeBtn.frame)*2)];
        _tyView.hidden = YES;
    }
    return _tyView;
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        if (self.isCompany) {
            _titleArray = @[@"默认",@"薪酬",@"距离"];
        }else{
            _titleArray = @[@"默认",@"热度",@"薪酬",@"距离",@"认证"];
        }
    }
    return _titleArray;
}

- (NSMutableArray <PositionModel *>*)positionList{
    if (!_positionList) {
        _positionList = [NSMutableArray array];
    }
    return _positionList;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YTEDCATIONNOTIFICATIONNAME object:nil];
}

#pragma mark ------------------Http----------------

- (void)findPositionWithKey:(NSString *)key pageNumber:(NSInteger)page{
    YTWeakSelf
    NSDictionary *dict = @{
                           @"key":YTReplaceNil(key),
                           @"pageNumber":@(page)
                           };
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTFindPositionUrl requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            [YTProgressHUD dismissHUD];
            YTLog(@"responseObject = %@",responseObject);
            NSArray *list = responseObject[@"positionList"][@"list"];
            NSMutableArray *dataArray = [NSMutableArray array];
            if (list.count > 0) {
                for (NSDictionary *dic in list) {
                    PositionModel *model = [PositionModel yy_modelWithJSON:dic];
                    [dataArray addObject:model];
                }
                weakSelf.positionList = dataArray;
                weakSelf.vc.positionList = weakSelf.positionList;
                weakSelf.vc1.positionList = weakSelf.positionList;
                weakSelf.vc2.positionList = weakSelf.positionList;
                weakSelf.vc3.positionList = weakSelf.positionList;
                weakSelf.vc4.positionList = weakSelf.positionList;
            }
        } @catch (NSException *exception) {
            [YTProgressHUD dismissHUD];
            YTLog(@"findPosition exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD dismissHUD];
        YTLog(@"findPosition error = %@",error);
    }];
}




@end
