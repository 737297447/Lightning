//
//  NZLMainView.m
//  Lighting
//
//  Created by longhy on 2017/4/20.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMainView.h"
#import "NZLSeekbar.h"
#import "NZLVerticalTextView.h"
#import "NZLLeftRightSingleView.h"
#import "Jiekuan.h"


@interface NZLMainView()<NZLSeekbarDelegate>

@property(nonatomic,weak)NZLSeekbar* seekBar;

@property(nonatomic,strong)UIView* jkView;
@property(nonatomic,strong)UILabel* jkLabel;
@property(nonatomic,strong)NZLLeftRightSingleView* jkBottomView;
@property(nonatomic,strong)NZLLeftRightSingleView* dzView;
@property(nonatomic,strong)NZLLeftRightSingleView* jktView;


@property(nonatomic,strong)UIView* detailView;
@property(nonatomic,strong)UIView* lineView1;
@property(nonatomic,strong)UIView* lineView2;
@property(nonatomic,strong)UIView* lineView3;
@property(nonatomic,strong)NZLVerticalTextView* view1;
@property(nonatomic,strong)NZLVerticalTextView* view2;
@property(nonatomic,strong)NZLVerticalTextView* view3;

@property(nonatomic,strong)UIButton* day7Btn;
@property(nonatomic,strong)UIButton* day14Btn;

@property(nonatomic,strong)NSMutableArray* moneyArray;//所有借款钱数和利息等

@end

@implementation NZLMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bindData];
        [self initUI];
    }
    return self;
}


-(void) initUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.jkView = [[UIView alloc]init];
    [self addSubview:self.jkView];
    
    self.jkLabel = [UILabel labelWithText:@"1120" textColor:RGB(255, 132, 0) font:18 textAliment:NSTextAlignmentCenter];
    [self.jkView addSubview:self.jkLabel];
    
    self.jkBottomView = [NZLLeftRightSingleView setImage:@"card_icon" setTitle:@"借款金额(元)"];
    [self.jkView addSubview:self.jkBottomView];
    
    
    self.detailView = [[UIView alloc]init];
    [self addSubview:self.detailView];
    
    
    self.view1 = [NZLVerticalTextView setTopText:@"1000" setBottomText:@"到账金额(元)"];
    [self.detailView addSubview:self.view1];
    self.view2 = [NZLVerticalTextView setTopText:@"120" setBottomText:@"手续费用(元)"];
    [self.detailView addSubview:self.view2];
    self.view3 = [NZLVerticalTextView setTopText:@"14" setBottomText:@"借款时间(天)"];
    [self.detailView addSubview:self.view3];
    
    self.lineView1 = [[UIView alloc]init];
    self.lineView1.backgroundColor = RGB(196, 196, 196);
    [self.detailView addSubview:self.lineView1];
    
    self.lineView2 = [[UIView alloc]init];
    self.lineView2.backgroundColor = RGB(196, 196, 196);
    [self.detailView addSubview:self.lineView2];
    
    self.lineView3 = [[UIView alloc]init];
    self.lineView3.backgroundColor = RGB(196, 196, 196);
    [self addSubview:self.lineView3];
    
    
    self.dzView = [NZLLeftRightSingleView setImage:@"home_rmb" setTitle:@"到账金额(元)"];
    [self addSubview:self.dzView];
    
    self.jktView = [NZLLeftRightSingleView setImage:@"icon_clock" setTitle:@"借款时间"];
    [self addSubview:self.jktView];
    
    NZLSeekbar *seekBar = [[NZLSeekbar alloc]init];
    self.seekBar = seekBar;
    self.seekBar.delegate = self;
    [self addSubview:self.seekBar];
    
    
    
    self.day7Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.day7Btn setTitle:@"7天" forState:UIControlStateNormal];
    [self.day7Btn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
    [self.day7Btn setTitleColor:RGB(152, 107, 0) forState:UIControlStateSelected];
    [self.day7Btn setBackgroundImage:[UIImage imageWithBgColor:RGB(196, 196, 196)] forState:UIControlStateNormal];
    [self.day7Btn setBackgroundImage:[UIImage imageWithBgColor:RGB(255, 214, 49)] forState:UIControlStateSelected];
    self.day7Btn.tag = 101;
    self.day7Btn.selected = NO;
    [self.day7Btn addTarget:self action:@selector(chooseDays:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.day7Btn];
    
    
    self.day14Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.day14Btn setTitle:@"14天" forState:UIControlStateNormal];
    [self.day14Btn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
    [self.day14Btn setTitleColor:RGB(152, 107, 0) forState:UIControlStateSelected];
    [self.day14Btn setBackgroundImage:[UIImage imageWithBgColor:RGB(196, 196, 196)] forState:UIControlStateNormal];
    [self.day14Btn setBackgroundImage:[UIImage imageWithBgColor:RGB(255, 214, 49)] forState:UIControlStateSelected];
    self.day14Btn.tag = 102;
    self.day14Btn.selected = YES;
    [self.day14Btn addTarget:self action:@selector(chooseDays:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.day14Btn];
    
    
    //设置当前seekBar的位置
    [self.seekBar setPosition:5];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.jkView.sd_layout.widthIs(SCREEN_WIDTH)
    .heightIs(60).topEqualToView(self);
    self.jkLabel.sd_layout.autoHeightRatio(0).centerXEqualToView(self.jkView)
    .centerYIs(self.jkView.centerY - 5);
    [self.jkLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.jkBottomView.sd_layout.centerXEqualToView(self.jkView)
    .centerYIs(self.jkView.centerY + self.jkLabel.height / 2 + 5).widthIs(100);
    
    
    self.detailView.sd_layout.widthIs(SCREEN_WIDTH).topSpaceToView(self.jkView, 5)
    .heightIs(70);
    
    self.view1.sd_layout.widthIs(SCREEN_WIDTH / 3)
    .leftEqualToView(self.detailView)
    .centerYEqualToView(self.detailView);
    
    self.lineView1.sd_layout.widthIs(0.5).heightIs(20)
    .centerYIs(self.view1.centerY)
    .leftSpaceToView(self.view1, 0);
    
    
    self.view2.sd_layout.leftSpaceToView(self.lineView1, 0)
    .centerYEqualToView(self.detailView)
    .widthIs(SCREEN_WIDTH / 3);
    
    self.lineView2.sd_layout.widthIs(0.5).heightIs(20)
    .centerYIs(self.view1.centerY)
    .leftSpaceToView(self.view2, 0);
    
    self.view3.sd_layout.leftSpaceToView(self.lineView2, 0)
    .centerYEqualToView(self.detailView)
    .widthIs(SCREEN_WIDTH / 3);
    
    self.lineView3.sd_layout.leftSpaceToView(self, 10)
    .rightSpaceToView(self, 10).
    topSpaceToView(self.detailView, 10)
    .heightIs(0.25);
    
    self.dzView.sd_layout.topSpaceToView(self.lineView3, 20)
    .leftSpaceToView(self, 10);
    
    self.seekBar.sd_layout.leftEqualToView(self).rightEqualToView(self).topSpaceToView(self.dzView, 10).heightIs(100);
    
    self.jktView.sd_layout.topSpaceToView(self.seekBar, 20)
    .leftSpaceToView(self, 10);
    
    self.day7Btn.sd_layout.widthIs(120).heightIs(40).centerXIs(SCREEN_WIDTH / 4)
    .topSpaceToView(self.jktView, 20);
    self.day7Btn.layer.cornerRadius = self.day7Btn.height / 2;
    self.day7Btn.clipsToBounds = YES;
    
    self.day14Btn.sd_layout.widthIs(120).heightIs(40).centerXIs(SCREEN_WIDTH / 4 * 3)
    .topSpaceToView(self.jktView, 20);
    self.day14Btn.layer.cornerRadius = self.day14Btn.height / 2;
    self.day14Btn.clipsToBounds = YES;
}




-(void)seekBarRangeText:(NSString*)rangeText
{
    
    for (NSInteger i = 0; i < self.moneyArray.count; i++) {
        Jiekuan* jk = self.moneyArray[i];
        
        if ([rangeText isEqualToString:jk.daozhangMoney] && [self.view3.topLabel.text
                                                             isEqualToString:jk.jiekuamDays]) {
            
            NSLog(@"当前拖拽的位置是:%@",rangeText);
            NSLog(@":%@",jk.jiekuamMoney);
            
            self.view1.topLabel.text = jk.daozhangMoney;
            self.view2.topLabel.text = jk.shouxuMoney;
            self.jkLabel.text = jk.jiekuamMoney;
        }
    }
    
    
}

-(void)chooseDays:(UIButton*)btn
{
    switch (btn.tag) {
        case 101:
            self.day7Btn.selected = YES;
            self.day14Btn.selected = NO;
            self.view3.topLabel.text = @"7";
            break;
        case 102:
            self.day7Btn.selected = NO;
            self.day14Btn.selected = YES;
            self.view3.topLabel.text = @"14";
            break;
        default:
            break;
    }
    
    for (NSInteger i = 0; i < self.moneyArray.count; i++) {
        Jiekuan* jk = self.moneyArray[i];
        
        if ([self.view1.topLabel.text isEqualToString:jk.daozhangMoney]
            && [self.view3.topLabel.text isEqualToString:jk.jiekuamDays]) {
            
            self.view2.topLabel.text = jk.shouxuMoney;
            self.jkLabel.text = jk.jiekuamMoney;
        }
    }
    
    
}

-(void) bindData
{
    self.moneyArray = [NSMutableArray array];
    
    Jiekuan* j1 = [[Jiekuan alloc]init];
    j1.jiekuamMoney = @"1120";
    j1.jiekuamDays = @"14";
    j1.daozhangMoney = @"1000";
    j1.shouxuMoney = @"120";
    j1.dayLilv = @"0.857142857";
    
    Jiekuan* j2 = [[Jiekuan alloc]init];
    j2.jiekuamMoney = @"1008";
    j2.jiekuamDays = @"14";
    j2.daozhangMoney = @"900";
    j2.shouxuMoney = @"108";
    j2.dayLilv = @"0.857142857";
    
    
    Jiekuan* j3 = [[Jiekuan alloc]init];
    j3.jiekuamMoney = @"896";
    j3.jiekuamDays = @"14";
    j3.daozhangMoney = @"800";
    j3.shouxuMoney = @"96";
    j3.dayLilv = @"0.857142857";
    
    Jiekuan* j4 = [[Jiekuan alloc]init];
    j4.jiekuamMoney = @"784";
    j4.jiekuamDays = @"14";
    j4.daozhangMoney = @"700";
    j4.shouxuMoney = @"84";
    j4.dayLilv = @"0.857142857";
    
    Jiekuan* j5 = [[Jiekuan alloc]init];
    j5.jiekuamMoney = @"672";
    j5.jiekuamDays = @"14";
    j5.daozhangMoney = @"600";
    j5.shouxuMoney = @"72";
    j5.dayLilv = @"0.857142857";
    
    
    Jiekuan* j6 = [[Jiekuan alloc]init];
    j6.jiekuamMoney = @"560";
    j6.jiekuamDays = @"14";
    j6.daozhangMoney = @"500";
    j6.shouxuMoney = @"60";
    j6.dayLilv = @"0.857142857";
    
    
    Jiekuan* j7 = [[Jiekuan alloc]init];
    j7.jiekuamMoney = @"1060";
    j7.jiekuamDays = @"7";
    j7.daozhangMoney = @"1000";
    j7.shouxuMoney = @"60";
    j7.dayLilv = @"0.857142857";
    
    
    Jiekuan* j8 = [[Jiekuan alloc]init];
    j8.jiekuamMoney = @"954";
    j8.jiekuamDays = @"7";
    j8.daozhangMoney = @"900";
    j8.shouxuMoney = @"54";
    j8.dayLilv = @"0.857142857";
    
    Jiekuan* j9 = [[Jiekuan alloc]init];
    j9.jiekuamMoney = @"848";
    j9.jiekuamDays = @"7";
    j9.daozhangMoney = @"800";
    j9.shouxuMoney = @"48";
    j9.dayLilv = @"0.857142857";
    
    
    Jiekuan* j10 = [[Jiekuan alloc]init];
    j10.jiekuamMoney = @"742";
    j10.jiekuamDays = @"7";
    j10.daozhangMoney = @"700";
    j10.shouxuMoney = @"42";
    j10.dayLilv = @"0.857142857";
    
    Jiekuan* j11 = [[Jiekuan alloc]init];
    j11.jiekuamMoney = @"636";
    j11.jiekuamDays = @"7";
    j11.daozhangMoney = @"600";
    j11.shouxuMoney = @"36";
    j11.dayLilv = @"0.857142857";
    
    Jiekuan* j12 = [[Jiekuan alloc]init];
    j12.jiekuamMoney = @"530";
    j12.jiekuamDays = @"7";
    j12.daozhangMoney = @"500";
    j12.shouxuMoney = @"30";
    j12.dayLilv = @"0.857142857";
    
    
    [self.moneyArray addObject:j1];
    [self.moneyArray addObject:j2];
    [self.moneyArray addObject:j3];
    [self.moneyArray addObject:j4];
    [self.moneyArray addObject:j5];
    [self.moneyArray addObject:j6];
    [self.moneyArray addObject:j7];
    [self.moneyArray addObject:j8];
    [self.moneyArray addObject:j9];
    [self.moneyArray addObject:j10];
    [self.moneyArray addObject:j11];
    [self.moneyArray addObject:j12];
    
}







@end
