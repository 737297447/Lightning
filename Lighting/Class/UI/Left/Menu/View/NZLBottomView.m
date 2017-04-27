//
//  NZLBottomView.m
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBottomView.h"
#import "NZLBottonCellView.h"
#import "NZLVerticalTextView.h"




@interface NZLBottomView()

@property(nonatomic,strong) NZLBottonCellView* oneView;
@property(nonatomic,strong) NZLBottonCellView* twoView;
@property(nonatomic,strong) NZLBottonCellView* threeView;
@property(nonatomic,strong) NZLBottonCellView* fourView;

@property(nonatomic,strong) UIView* bottomView;
@property(nonatomic,strong) NZLVerticalTextView* settingView;
@property(nonatomic,strong) NZLVerticalTextView* helpView;
@property(nonatomic,strong) UIView* lineView;


@end


@implementation NZLBottomView

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
    self.oneView = [NZLBottonCellView setImage:[UIImage imageNamed:@"icon_card"] withText:@"我的借款"];
    self.oneView.tag = 101;
    [self.oneView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.twoView = [NZLBottonCellView setImage:[UIImage imageNamed:@"icon_order"] withText:@"我的优惠券"];
    self.twoView.tag = 102;
    [self.twoView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.threeView = [NZLBottonCellView setImage:[UIImage imageNamed:@"icon_share"] withText:@"分享好友"];
    self.threeView.tag = 103;
    [self.threeView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.fourView = [NZLBottonCellView setImage:[UIImage imageNamed:@"icon_dh_gjrz"] withText:@"高级认证"];
    [self.fourView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.fourView.tag = 104;
    
    
    [self addSubview:self.oneView];
    [self addSubview:self.twoView];
    [self addSubview:self.threeView];
    [self addSubview:self.fourView];
    [self.twoView setMessage:@"0"];
    
    
    self.bottomView = [[UIView alloc]init];
    [self addSubview:self.bottomView];
    
    
    self.settingView = [NZLVerticalTextView setTopImage:@"-icon_set-up" setBottomText:@"设置"];
    self.settingView.tag = 105;
    [self.settingView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.helpView = [NZLVerticalTextView setTopImage:@"icon_help" setBottomText:@"帮助与反馈"];
    self.helpView.tag = 106;
    [self.helpView addTarget:self action:@selector(pressMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.bottomView addSubview:self.settingView];
    [self.bottomView addSubview:self.helpView];
    
    
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = RGB(105, 105, 105);
    [self.bottomView addSubview:self.lineView];
    
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = 50;
    
    self.oneView.frame = CGRectMake(0, 0, self.width, height);
    self.twoView.frame = CGRectMake(0, 50, self.width, height);
    self.threeView.frame = CGRectMake(0, 100, self.width, height);
    self.fourView.frame = CGRectMake(0, 150, self.width, height);
    
    
    CGFloat bottonHeight = 100;
    CGFloat bottomWidth = self.width;
    
    
    self.bottomView.frame = CGRectMake(0, self.height - bottonHeight, bottomWidth, bottonHeight);
    
    self.settingView.sd_layout.centerYEqualToView(self.bottomView)
    .centerXIs(self.bottomView.width / 4).widthIs(self.bottomView.width / 2);
    
    self.lineView.sd_layout.centerXEqualToView(self.bottomView).centerYEqualToView(self.bottomView).widthIs(0.5).heightIs(21);
    
    self.helpView.sd_layout.centerYEqualToView(self.bottomView)
    .centerXIs(self.bottomView.width / 4 * 3).widthIs(self.bottomView.width / 2);
    
    
}

-(void)pressMenu:(UIButton*) btn
{
    NSDictionary* dict = [[NSDictionary alloc]initWithObjectsAndKeys:@(btn.tag),LEFT_MENU_BOTTOM_KET,nil];
    
    [NZLNotification postNotificationName:LEFT_MENU_BOTTOM object:nil userInfo:dict];
    
    switch (btn.tag) {
        case 101:
            NSLog(@"我的借款");
            break;
        case 102:
            NSLog(@"我的优惠券");
            break;
        case 103:
            NSLog(@"分享好友");
            break;
        case 104:
            NSLog(@"高级认证");
            break;
        case 105:
            NSLog(@"设置点击");
            break;
        case 106:
            NSLog(@"帮助点击");
            break;
            
        default:
            break;
    }
}



@end
