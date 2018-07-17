//
//  ModifyPhoneOrEmailViewController.h
//  YTproject
//
//  Created by 郭嘉润 on 2018/7/17.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTBaseViewController.h"

typedef NS_ENUM(NSInteger,ModifyType){
    ModifyPhone = 0,     //修改手机号
    ModifyEmail,         //修改邮箱
    BindPhone,           //绑定手机
};

@interface ModifyPhoneOrEmailViewController : YTBaseViewController

-(instancetype)initWithType:(ModifyType)type;

@end
