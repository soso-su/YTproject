//
//  OrderListCell.m
//  YTproject
//
//  Created by suhuahao on 2018/7/20.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "OrderListCell.h"

@interface OrderListCell()
@property (weak, nonatomic) IBOutlet UIButton *refundBtn;
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hideBottomConstraint;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderNum;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;



@end

@implementation OrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setListModel:(OrderListModel *)listModel{
    _listModel = listModel;
    if (listModel.isHideBottom) {
        self.bottom.hidden = YES;
        self.hideBottomConstraint.priority = 750;
        
    }else{
        self.bottom.hidden = NO;
        self.hideBottomConstraint.priority = 249;
        if (!listModel.isHideLeftBtn) {
            [self.leftBtn setTitle:listModel.leftBtnStr forState:UIControlStateNormal];
        }else{
            self.leftBtn.hidden = YES;
        }
        [self.rightBtn setTitle:listModel.rightBtnStr forState:UIControlStateNormal];
    }
    
    if (listModel.isHideRefund) {
        self.refundBtn.hidden = YES;
    }else{
        self.refundBtn.hidden = NO;
    }
    
    self.orderStateLabel.text = listModel.stateStr;
    
    [self.leftBtn setTitle:listModel.leftBtnStr forState:UIControlStateNormal];
    
    [self.rightBtn setTitle:listModel.rightBtnStr forState:UIControlStateNormal];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickCancle:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate cancleOrder:self.listModel];
    }
}
- (IBAction)clickComfirm:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate comfirmOrder:self.listModel];
    }
}

@end
