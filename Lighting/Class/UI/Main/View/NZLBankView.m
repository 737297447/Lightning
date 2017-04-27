//
//  NZLBankView.m
//  Lighting
//
//  Created by longhy on 2017/4/26.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBankView.h"

@implementation NZLBankView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[UIImageView alloc]init];
    [self.iconView setImage:[UIImage imageNamed:@"icon_app"]];
    [self addSubview:self.iconView];
    
    self.bankNameLabel = [UILabel labelWithText:@"招商银行" textColor:RGB(34, 34, 34) font:15 textAliment:NSTextAlignmentCenter];
    [self addSubview:self.bankNameLabel];
    
    self.bankDetailLabel = [UILabel labelWithText:@"尾号1139储蓄卡" textColor:RGB(153, 153, 153) font:12 textAliment:NSTextAlignmentCenter];
    [self addSubview:self.bankDetailLabel];
    
    
    self.arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_next"]];
    [self addSubview:self.arrowView];
    
    
    
    self.iconView.sd_layout.widthIs(40).heightIs(40)
    .centerYEqualToView(self).leftSpaceToView(self, 7);
    
    self.bankNameLabel.sd_layout.leftSpaceToView(self.iconView, 12).topEqualToView(self.iconView).autoHeightRatio(0);
    [self.bankNameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.bankDetailLabel.sd_layout.leftSpaceToView(self.iconView, 12).bottomEqualToView(self.iconView).autoHeightRatio(0);
    [self.bankDetailLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.arrowView.sd_layout.rightSpaceToView(self, 7)
    .centerYEqualToView(self).heightIs(15).widthIs(7.5);
    
    
}


@end
