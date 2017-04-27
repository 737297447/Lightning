//
//  NZLHeaderView.m
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLHeaderView.h"
#import "NZLNumView.h"



@interface NZLHeaderView()

@property(nonatomic,strong) UIImageView* bgImageView;
@property(nonatomic,strong) UIImageView* iconImageView;

@property(nonatomic,strong) UIButton* userIconButton;
@property(nonatomic,strong) UIButton* loginButton;
@property(nonatomic,strong) UIButton* peopleCenterButton;

@property(nonatomic,strong) UIView* lineView;

@property(nonatomic,strong) NZLNumView* jiekuanView;
@property(nonatomic,strong) NZLNumView* jijiuView;


@end

@implementation NZLHeaderView

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
    self.bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    self.bgImageView.userInteractionEnabled = YES;
    [self addSubview:self.bgImageView];
    
    self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head_bg"]];
    self.iconImageView.userInteractionEnabled = YES;
    [self.bgImageView addSubview:self.iconImageView];
    
    self.userIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.userIconButton setImage:[UIImage imageNamed:@"small_head-0"] forState:UIControlStateNormal];

    self.userIconButton.tag = NZLHeaderTypeUserIcon;
    [self.userIconButton addTarget:self action:@selector(pressClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.iconImageView addSubview:self.userIconButton];
    
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    self.loginButton.tag = NZLHeaderTypeLogin;
    [self.loginButton addTarget:self action:@selector(pressClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImageView addSubview:self.loginButton];
    
    
    self.peopleCenterButton = [[UIButton alloc]init];
    [self.peopleCenterButton setImage:[UIImage imageNamed:@"btn_personal-center"] forState:UIControlStateNormal];
    self.peopleCenterButton.tag = NZLHeaderTypePeopleCenter;
    [self.peopleCenterButton addTarget:self action:@selector(pressClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImageView addSubview:self.peopleCenterButton];
    
    
    self.jiekuanView = [[NZLNumView alloc]init];
    self.jiekuanView.hidden = YES;
    [self.bgImageView addSubview:self.jiekuanView];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor whiteColor];
    self.lineView.alpha = 0.2;
    self.lineView.hidden = YES;
    [self.bgImageView addSubview:self.lineView];
    
    self.jijiuView = [[NZLNumView alloc]init];
    self.jijiuView.hidden = YES;
    [self.bgImageView addSubview:self.jijiuView];
    
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImageView.frame = self.bounds;
    
    
    self.iconImageView.sd_layout.leftSpaceToView(self.bgImageView, 18).widthIs(43).heightIs(43);
    self.iconImageView.centerY = self.bgImageView.centerY;
    
    self.userIconButton.sd_layout.heightIs(40).widthIs(40).centerXEqualToView(self.iconImageView).centerYEqualToView(self.iconImageView);
    self.userIconButton.layer.cornerRadius = self.userIconButton.height / 2;
    self.userIconButton.clipsToBounds = YES;
    
    
    self.loginButton.sd_layout.leftSpaceToView(self.iconImageView, 20)
                            .centerYEqualToView(self.bgImageView)
    .heightIs(50).widthIs(100);
    
    self.peopleCenterButton.sd_layout.bottomSpaceToView(self.bgImageView, 5)
    .rightSpaceToView(self.bgImageView, 5).widthIs(self.loginButton.width)
    .heightIs(self.loginButton.height);
    
    

    self.jiekuanView.sd_layout.leftSpaceToView(self.iconImageView, 22)
    .topEqualToView(self.loginButton).widthIs(self.width / 5);
    self.jiekuanView.numLb.text = @"1000.00";
    self.jiekuanView.desLb.text = @"借款总额";
    
    self.lineView.sd_layout.leftSpaceToView(self.jiekuanView, 20)
    .heightIs(20)
    .widthIs(1).centerYEqualToView(self.bgImageView);
    
    
    self.jijiuView.sd_layout.topEqualToView(self.jiekuanView)
    .leftSpaceToView(self.lineView, 20).widthIs(self.jiekuanView.frame.size.width);
    self.jijiuView.numLb.text = @"0";
    self.jijiuView.desLb.text = @"急救次数";
    
    
}


-(void)pressClick:(UIButton*)btn
{
//    if (self.black) {
//        self.black(self, btn.tag);
//    }
    
    
    NSDictionary* dict = [[NSDictionary alloc]initWithObjectsAndKeys:
                          @(btn.tag),LEFT_MENU_TOP_KET, nil];
    
    [NZLNotification postNotificationName:LEFT_MENU_TOP object:nil userInfo:dict];
    
    
    
    switch (btn.tag) {
        case 101:
            
            break;
        case 102:
            [self isChangeShowOrHiddle:YES];
            break;
        case 103:
            
            break;
        default:
            break;
    }
}


-(void)isChangeShowOrHiddle:(BOOL)isShow
{
    self.loginButton.hidden = isShow;
  
    self.lineView.hidden = !isShow;
    self.jijiuView.hidden = !isShow;
    self.jiekuanView.hidden = !isShow;
}


@end
