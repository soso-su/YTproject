//
//  YTEditResumeViewController.m
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/18.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTEditResumeBaseInformationViewController.h"
#import "YTEditResumeTableViewCell.h"
#import "YTSelectSexView.h"
#import "YTDatePickerView.h"
#import "YTAlertView.h"
#import "EditResumeModel.h"
#import "YTResumeViewController.h"
#import "YTEditResumeWorkExperienceViewController.h"
#import "YTUploadImage.h"
#import <SDWebImage/UIButton+WebCache.h>

@interface YTEditResumeBaseInformationViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet YTTouchView *avatarView;
@property (nonatomic,copy)NSMutableArray *detailTitleArr;

@property (nonatomic, strong) EditResumeModel *editModel;

@end

@implementation YTEditResumeBaseInformationViewController

static NSString *const TableViewCellId = @"TableViewCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    if ([self.title isEqualToString:@"编辑简历"]) {
        [self editResume];
    }
    self.detailTitleArr = [[NSMutableArray alloc]initWithObjects:@"姓名",@"国籍",@"男",@"语言",@"1992.06.01",@"最高学历",@"工作年限",@"签证类型",@"一句话描述自己", nil];
}



- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    vc.basePreview = YES;
    vc.reModel = self.editModel;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)nextStep:(UIButton *)sender {
    NSDictionary *dict = @{
                           @"name":YTReplaceNil(self.editModel.name),
                           @"avatar_url":YTReplaceNil(self.editModel.avatar_url),
                           @"nation":YTReplaceNil(self.editModel.nation),
                           @"sex":@(self.editModel.sex),
                           @"language":YTReplaceNil(self.editModel.language),
                           @"birthday":YTReplaceNil(self.editModel.birthday),
                           @"education":YTReplaceNil(self.editModel.education),
                           @"working_life":@(self.editModel.working_life),
                           @"visa_type":@(self.editModel.visa_type),
                           @"introduce":YTReplaceNil(self.editModel.introduce)
                           };
   
    [self addResumeWithDic:dict];
    
    
}


- (EditResumeModel *)editModel{
    if (!_editModel) {
        _editModel = [[EditResumeModel alloc]init];
    }
    return _editModel;
}


#pragma mark -------------UIImagePickerControllerDelegate-------

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    YTWeakSelf
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *avaImage = [YTTool imageResize:image andResizeTo:CGSizeMake(100, 100)];
    self.avatarImageView.image = avaImage;
    [picker dismissViewControllerAnimated:YES completion:^{}];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTUploadImage uploadFile:data fileName:@"avatar" parameters:nil uploadType:uploadType_image success:^(id responseObject) {
        [YTProgressHUD showSuccessWithStr:@"上传成功"];
        weakSelf.editModel.avatar_url = responseObject;
        YTLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:@"上传失败,请检查网络"];
        YTLog(@"%@",error);
    }];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}


#pragma mark =======================UITableViewDataSource=========================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 9){
        
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        cell.backgroundColor = UIColor.clearColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"目前居住城市";
        cell.textLabel.x = 0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        cell.indentationLevel = 1;
        cell.indentationWidth = 1;
        cell.textLabel.textColor = UIColor.blackColor;
        cell.detailTextLabel.text = YTReplaceNil(self.editModel.live);
        
        return cell;
    }else{
        
        YTEditResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
        if (self.editModel.name.length > 0) {
            
            switch (indexPath.row) {
                case 0:
                    cell.textField.text = YTReplaceNil(self.editModel.name);
                    break;
                case 1:
                    cell.textField.text = YTReplaceNil(self.editModel.nation);
                    break;
                case 2:
                    cell.textField.text = self.editModel.sex == 0 ? @"男":@"女";
                    break;
                case 3:
                    cell.textField.text = YTReplaceNil(self.editModel.language);
                    break;
                case 4:
                    cell.textField.text = YTReplaceNil(self.editModel.birthday);
                    break;
                case 5:
                    cell.textField.text = YTReplaceNil(self.editModel.education);
                    break;
                case 6:
                    cell.textField.text = [NSString stringWithFormat:@"%zd",self.editModel.working_life];
                    break;
                case 7:
                    if (self.editModel.visa_type == 0) {
                        cell.textField.text = @"旅游签";
                    }else if (self.editModel.visa_type == 1){
                        cell.textField.text = @"工作签";
                    }else if (self.editModel.visa_type == 2){
                        cell.textField.text = @"学生签";
                    }else{
                        cell.textField.text = @"中国身份证";
                    }
                    break;
                default:
                    cell.textField.text = YTReplaceNil(self.editModel.introduce);
                    break;
            }
        }
        cell.textField.placeholder = self.detailTitleArr[indexPath.row];
        [cell.textField setEnabled:NO];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

#pragma mark =======================UITableViewDelegate=========================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    YTWeakSelf
    if (index == 9) {
        
    }else{
        YTEditResumeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (index == 0) {
            [cell.textField setEnabled:YES];
            [cell.textField becomeFirstResponder];
            [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (cell.textField.text.length > 0) {
                    weakSelf.editModel.name = cell.textField.text;
                }
            }];
            
        }else if (index == 1){
            [cell.textField setEnabled:YES];
            [cell.textField becomeFirstResponder];
            [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (cell.textField.text.length > 0) {
                    weakSelf.editModel.nation = cell.textField.text;
                }
            }];
            
        }
        
        if (index == 2) { //选择性别
            
            [YTSelectSexView showWithDefaultSelectIndex:0 SelectBlock:^(SexType type) {
                YTLog(@"type = %ld",(long)type);
                if (type == 0) {
                    cell.textField.text = @"男";
                }else{
                    cell.textField.text = @"女";
                }
                weakSelf.editModel.sex = type;
            }];
        }
        if (index == 3){
            [cell.textField setEnabled:YES];
            [cell.textField becomeFirstResponder];
            [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (cell.textField.text.length > 0) {
                    weakSelf.editModel.language = cell.textField.text;
                }
            }];
            
            
        }
        
        if (index == 4) {
            NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
            [fmt setDateFormat:@"yyyy-MM-dd"];
            NSDate *defaultDate = [fmt dateFromString:@"1990-01-01"];
            [YTDatePickerView showWithDefaultSelectDate:defaultDate SelectBlock:^(NSDate * date) {
                NSString *str = [fmt stringFromDate:date];
                weakSelf.editModel.birthday = str;
                cell.textField.text = weakSelf.editModel.birthday;
            }];
        }
        
        if (index == 5) {
            YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"其他",nil];
            alertView.buttonClickHandle = ^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    cell.textField.text = @"博士";
                }else if (buttonIndex == 1){
                    cell.textField.text = @"硕士";
                }else if (buttonIndex == 2){
                    cell.textField.text = @"本科";
                }else{
                    cell.textField.text = @"其他";
                }
                weakSelf.editModel.education = cell.textField.text;
            };
            [alertView show];
        }
        
        if (index == 6) {
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            [cell.textField setEnabled:YES];
            [cell.textField becomeFirstResponder];
            [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (cell.textField.text.length > 0) {
                    weakSelf.editModel.working_life = [cell.textField.text integerValue];
                }
            }];
            
        }
        
        if (index == 7) {
            YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"旅游签",@"工作签",@"学生签",@"中国身份证",nil];
            alertView.buttonClickHandle = ^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    cell.textField.text = @"旅游签";
                }else if (buttonIndex == 1){
                    cell.textField.text = @"工作签";
                }else if (buttonIndex == 2){
                    cell.textField.text = @"学生签";
                }else if (buttonIndex == 3){
                    cell.textField.text = @"中国身份证";
                }
                weakSelf.editModel.visa_type = buttonIndex;
            };
            [alertView show];
        }
        if (index == 8) {
            [cell.textField setEnabled:YES];
            [cell.textField becomeFirstResponder];
            [[cell.textField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (cell.textField.text.length > 0) {
                    weakSelf.editModel.introduce = cell.textField.text;
                }
            }];
        }
    }
}

#pragma mark =======================Setup=========================
-(void)setupView{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YTEditResumeTableViewCell class]) bundle:nil] forCellReuseIdentifier:TableViewCellId];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarView.touchHandler = ^{
        __block NSUInteger sourceType = 0;
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        YTAlertView *alertView = [YTAlertView alertViewWithTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择",@"取消",nil];
        alertView.buttonClickHandle = ^(NSInteger buttonIndex) {
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerController.allowsEditing = YES;
                imagePickerController.sourceType = sourceType; //
                if (buttonIndex == 0) {
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    imagePickerController.sourceType = sourceType;
                    [self presentViewController:imagePickerController animated:YES completion:nil];
                }else if (buttonIndex == 1){
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    imagePickerController.sourceType = sourceType;
                    [self presentViewController:imagePickerController animated:YES completion:nil];
                }
            }else {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }
        };
        [alertView show];
    };
   
    
}


#pragma mark -------------------Http----------------


/**
 添加简历

 @param dic 提交的参数集合
 */
- (void)addResumeWithDic:(NSDictionary *)dic{
    [YTHttpTool requestWithUrlStr:YTAddResume requestType:RequestType_post parameters:dic success:^(id responseObject) {
        @try {
            YTLog(@"YTAddResume responseObject = %@",responseObject);
            YTEditResumeWorkExperienceViewController *vc = [[YTEditResumeWorkExperienceViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        } @catch (NSException *exception) {
           YTLog(@"YTAddResume exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        YTLog(@"YTAddResume error = %@",error);
    }];
}


/**
 编辑简历
 */
- (void)editResume{
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTEditResume requestType:RequestType_get parameters:nil success:^(id responseObject) {
        YTLog(@"editResume responseObject = %@",responseObject);
        @try {
            NSDictionary *dict = responseObject[@"resume"];
            weakSelf.editModel = [EditResumeModel yy_modelWithJSON:dict];
            [weakSelf.avatarImageView sd_setImageWithURL:[NSURL URLWithString:weakSelf.editModel.avatar_url] placeholderImage:[UIImage imageNamed:@"commentPic"]];
            [weakSelf.tableView reloadData];
        } @catch (NSException *exception) {
            YTLog(@"editResume exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        YTLog(@"editResume error = %@",error);
    }];
}


@end
