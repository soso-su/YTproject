//
//  YTAddStatusCertificateViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/7/27.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTAddStatusCertificateViewController.h"
#import "YTCommitVCRViewController.h"
#import "YTResumeViewController.h"
#import "ResumeModel.h"
#import "YTUploadImage.h"

typedef NS_ENUM(NSInteger,takeType){
    takeType_teacher = 0,
    takeType_other
};

@interface YTAddStatusCertificateViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *remarkTF;
@property (weak, nonatomic) IBOutlet UIButton *teacherButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (nonatomic, assign)takeType type;

@property (nonatomic ,strong) EditResumeModel *resumModel;

@end

@implementation YTAddStatusCertificateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self editResume];
    self.title = @"编辑简历";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(preview)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)takePhotoWithType:(takeType)type{
    self.type = type;
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
}

- (void)upImageWithImage:(UIImage *)image imageName:(NSString *)name callBack:(void (^)(id result))callback{
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [YTUploadImage uploadFile:data fileName:name parameters:nil uploadType:uploadType_image success:^(id responseObject) {
        YTLog(@"%@",responseObject);
        callback(responseObject);
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:@"上传失败,请检查网络"];
        YTLog(@"%@",error);
    }];
}


- (IBAction)clickTeacher:(UIButton *)sender {
    [self takePhotoWithType:takeType_teacher];
}
- (IBAction)clickOther:(UIButton *)sender {
    [self takePhotoWithType:takeType_other];
}

- (IBAction)next:(UIButton *)sender {
    YTCommitVCRViewController *vc = [[YTCommitVCRViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
//    YTWeakSelf
//    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
//    [self upImageWithImage:self.resumModel.qualificationImage imageName:@"qualificationImage" callBack:^(id result) {
//        weakSelf.resumModel.qualification = result;
//        [weakSelf upImageWithImage:weakSelf.resumModel.other_certificatesImage imageName:@"other_certificatesImage" callBack:^(id result) {
//            weakSelf.resumModel.other_certificates = result;
//            NSDictionary *dict = @{
//                                   @"qualification":YTReplaceNil(weakSelf.resumModel.qualification),
//                                   @"other_certificates":YTReplaceNil(weakSelf.resumModel.other_certificates),
//                                   @"certificates_remark":YTReplaceNil(weakSelf.resumModel.certificates_remark)
//                                   };
//            [weakSelf alterResumeWithDic:dict];
//        }];
//    }];
    
}

- (void)preview{
    YTResumeViewController *vc = [[YTResumeViewController alloc]init];
    vc.basePreview = YES;
    vc.reModel = self.resumModel;
    [self.navigationController pushViewController:vc animated:YES];
}

- (EditResumeModel *)resumModel{
    if (!_resumModel) {
        _resumModel = [[EditResumeModel alloc]init];
    }
    return _resumModel;
}



#pragma mark -------------UIImagePickerControllerDelegate，UITextFieldDelegate-------

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length > 0) {
        self.resumModel.certificates_remark = textField.text;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (self.type == takeType_teacher) {
        [self.teacherButton setImage:image forState:UIControlStateNormal];
        self.resumModel.qualificationImage = image;
        YTLog(@"%@",self.resumModel.qualificationImage);
    }else{
        [self.otherButton setImage:image forState:UIControlStateNormal];
        self.resumModel.other_certificatesImage = image;
        YTLog(@"%@",self.resumModel.other_certificatesImage);
    }
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark ---------------------http-----------------------

/**
 编辑简历
 */
- (void)editResume{
    YTWeakSelf
    [YTProgressHUD showWithStatusStr:YTHttpState_RequestIng];
    [YTHttpTool requestWithUrlStr:YTEditResume requestType:RequestType_get parameters:nil success:^(id responseObject) {
        YTLog(@"editResume responseObject = %@",responseObject);
        @try {
            [YTProgressHUD dismissHUD];
            weakSelf.resumModel = [EditResumeModel yy_modelWithJSON:responseObject[@"resume"]];
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"editResume exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"editResume error = %@",error);
    }];
}

- (void)alterResumeWithDic:(NSDictionary *)dict{
    YTWeakSelf
    [YTHttpTool requestWithUrlStr:YTEditCertificate requestType:RequestType_post parameters:dict success:^(id responseObject) {
        @try {
            if ([responseObject[YTCode] integerValue] == YTCode2000) {
                [YTProgressHUD showSuccessWithStr:responseObject[YTMsg]];
                YTCommitVCRViewController *vc = [[YTCommitVCRViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else{
                [YTProgressHUD showErrorWithStr:responseObject[YTMsg]];
            }
        } @catch (NSException *exception) {
            [YTProgressHUD showErrorWithStr:YTHttpState_RequestCatch];
            YTLog(@"alterResume exception = %@",exception.description);
        }
    } failure:^(NSError *error) {
        [YTProgressHUD showErrorWithStr:YTHttpState_RequestFail];
        YTLog(@"alterResume error = %@",error);
    }];
}


@end
