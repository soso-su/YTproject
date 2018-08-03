//
//  CustomButton.h
//  YTproject
//
//  Created by suhuahao on 2018/7/9.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CustomButtonType){
    ImageUpLabelDown = 0,
    ImageLeftLabelRight = 1,
    LabelLeftImageRight,
};


@interface CustomButton : UIButton

@property (nonatomic,assign)IBInspectable CGSize imageViewSize;
@property (nonatomic,assign)IBInspectable NSInteger customButtonType_IBInspector; //xib中设置的type
@property (nonatomic,assign)IBInspectable CGFloat margin;//label和image之间的距离

@property (nonatomic,assign) CustomButtonType customButtonType;


@property (nonatomic,assign)CGFloat fontSize;

@end
