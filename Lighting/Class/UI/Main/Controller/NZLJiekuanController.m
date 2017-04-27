//
//  NZLJiekuanController.m
//  Lighting
//
//  Created by longhy on 2017/4/21.
//  Copyright © 2017年 longhy. All rights reserved.
//
//

#import "NZLJiekuanController.h"
#import "NZLVerticalTextView.h"
#import "NZLBankView.h"
#import "NZLHorCellView.h"
#import "WKWebViewController.h"


@interface NZLJiekuanController ()

@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong)NZLVerticalTextView* moneyView;
@property(nonatomic,strong)NZLVerticalTextView* dayView;

@property(nonatomic,strong)NZLBankView* bankView;

@property(nonatomic,strong)NZLHorCellView* yhqCellView;//优惠券
@property(nonatomic,strong)NZLHorCellView* hkTimeCellView;//还款时间
@property(nonatomic,strong)NZLHorCellView* moneyCellView;//到账金额
@property(nonatomic,strong)NZLHorCellView* sxCellView;//手续费用

@property(nonatomic,strong)UILabel* xyLeftLabel;
@property(nonatomic,strong)UIButton* xyRightLabel;


@property(nonatomic,strong)UIView* bottomView;
@property(nonatomic,strong)UILabel* hkLabel;//还款金额
@property(nonatomic,strong)UILabel* hkAddLabel;//到账金额+手续费
@property(nonatomic,strong)UILabel* hkYhqLabel;//优惠券
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIButton* okBtn;

@end

@implementation NZLJiekuanController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    

}



-(void)initUI
{
    
    self.topView = [[UIView alloc]init];
    self.topView.backgroundColor = RGB(70, 151, 251);
    [self.view addSubview:self.topView];
    
    self.moneyView = [NZLVerticalTextView setTopText:@"1000" setBottomText:@"借款金额(元)"];
    [self.moneyView setTopTextSize:35 withTextColor:[UIColor whiteColor]];
    [self.topView addSubview:self.moneyView];
    
    self.dayView = [NZLVerticalTextView setTopText:@"7" setBottomText:@"借款期限(天)"];
    [self.dayView setTopTextSize:35 withTextColor:[UIColor whiteColor]];
    [self.topView addSubview:self.dayView];
    
    self.bankView = [[NZLBankView alloc]init];
    [self.view addSubview:self.bankView];
    
    self.yhqCellView = [NZLHorCellView setTitle:@"优惠券"];
    [self.yhqCellView isShowLineView:NO];
    [self.yhqCellView setRightText:@"-$5.7" withColor:RGB(255, 132, 0)];
    [self.view addSubview:self.yhqCellView];
    
    self.hkTimeCellView = [NZLHorCellView setTitle:@"还款时间" withColor:RGB(102, 102, 102)];
    [self.hkTimeCellView setRightText:@"2016-12-12" withColor:RGB(34, 34, 34)];
    [self.hkTimeCellView isShowRight:NO];
    [self.view addSubview:self.hkTimeCellView];
    
    self.moneyCellView = [NZLHorCellView setTitle:@"到账金额" withColor:RGB(102, 102, 102)];
    [self.moneyCellView isShowRight:NO];
    [self.moneyCellView setRightText:@"$876" withColor:RGB(34, 34, 34)];
    [self.view addSubview:self.moneyCellView];
    
    self.sxCellView = [NZLHorCellView setTitle:@"手续费用" withColor:RGB(102, 102, 102)];
    [self.sxCellView isShowLineView:NO];
    [self.sxCellView isShowRight:NO];
    [self.sxCellView setRightText:@"+$124" withColor:RGB(34, 34, 34)];
    [self.view addSubview:self.sxCellView];
    
    self.xyLeftLabel = [UILabel labelWithText:@"点击确认提交即代表同意" textColor:RGB(102, 102, 102) font:12 textAliment:NSTextAlignmentCenter];
    [self.view addSubview:self.xyLeftLabel];
    
    self.xyRightLabel = [UIButton buttonWithTitle:@"《闪贷侠借款协议》" titleColor:RGB(70, 151, 251) titleFont:12];
    [self.xyRightLabel addTarget:self action:@selector(pressXieYi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.xyRightLabel];
    
    
    self.bottomView = [[UIView alloc]init];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bottomView];
    
    self.hkLabel = [UILabel labelWithText:@"还款金额:$1000" textColor:RGB(34, 34, 34) font:13 textAliment:NSTextAlignmentCenter];
    [self.bottomView addSubview:self.hkLabel];
    
    self.hkAddLabel = [UILabel labelWithText:@"$867+$124" textColor:RGB(153, 153, 153) font:13 textAliment:NSTextAlignmentCenter];
    [self.bottomView addSubview:self.hkAddLabel];
    
    self.hkYhqLabel = [UILabel labelWithText:@"-$5.7" textColor:RGB(255, 132, 0) font:13 textAliment:NSTextAlignmentCenter];
    [self.bottomView addSubview:self.hkYhqLabel];
    
    self.okBtn = [UIButton buttonWithTitle:@"确认提交" titleColor:RGB(153, 108, 0) titleFont:15];
    self.okBtn.backgroundColor = RGB(255, 214, 49);
    [self.okBtn addTarget:self action:@selector(pressOK) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.okBtn];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = RGB(153, 153, 153);
    [self.bottomView addSubview:self.lineView];
    
 
    [self layouts];
    
}


-(void) layouts
{
    self.topView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topEqualToView(self.view).heightIs(140);
    
    self.moneyView.sd_layout.centerYIs(self.topView.centerY).centerXIs(SCREEN_WIDTH / 4);
    
    self.dayView.sd_layout.centerYIs(self.topView.centerY).centerXIs(SCREEN_WIDTH / 4 * 3);
    
    self.bankView.sd_layout.topSpaceToView(self.topView, 9).heightIs(60)
      .leftEqualToView(self.view).rightEqualToView(self.view);
    
    self.yhqCellView.sd_layout.topSpaceToView(self.bankView, 10).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(50);
    
    self.hkTimeCellView.sd_layout.topSpaceToView(self.yhqCellView, 10).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(50);
    
    self.moneyCellView.sd_layout.topSpaceToView(self.hkTimeCellView, 0).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(50);
    
    self.sxCellView.sd_layout.topSpaceToView(self.moneyCellView, 0).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(50);
    
    self.xyLeftLabel.sd_layout.leftSpaceToView(self.view, 7).topSpaceToView(self.sxCellView, 10).heightIs(20);
    [self.xyLeftLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.xyRightLabel.sd_layout.leftSpaceToView(self.xyLeftLabel, 0)
    .topEqualToView(self.xyLeftLabel);
    
    [self.xyRightLabel setupAutoSizeWithHorizontalPadding:0 buttonHeight:self.xyLeftLabel.height];
    
    self.bottomView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .bottomEqualToView(self.view).heightIs(60);
    self.hkLabel.sd_layout.centerYEqualToView(self.bottomView).leftSpaceToView(self.bottomView, 7).autoHeightRatio(0);
    [self.hkLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.lineView.sd_layout.widthIs(0.5).heightIs(10).centerYEqualToView(self.bottomView).leftSpaceToView(self.hkLabel, 11);
    
    self.hkAddLabel.sd_layout.leftSpaceToView(self.lineView, 15).centerYEqualToView(self.bottomView).autoHeightRatio(0);
    [self.hkAddLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.hkYhqLabel.sd_layout.leftSpaceToView(self.hkAddLabel, 0).centerYEqualToView(self.bottomView).autoHeightRatio(0);
    [self.hkYhqLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.okBtn.sd_layout.rightEqualToView(self.bottomView).topEqualToView(self.bottomView).bottomEqualToView(self.bottomView).widthIs(95);
    
    
}



-(void)initNavBar
{
    self.title = @"确认借款";
    // 导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:RGB(70, 151, 251)];
    // 导航栏标题字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 导航栏左右按钮字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //自定义一个NaVIgationBar,取消下面那条横线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //消除阴影
    self.navigationController.navigationBar.shadowImage = [UIImage new];

}


-(void)pressXieYi
{
    NSLog(@"点击协议");
    WKWebViewController *web = [[WKWebViewController alloc] init];
    [web loadWebURLSring:@"https://www.baidu.com"];
    [self.navigationController pushViewController:web animated:YES];
}

-(void)pressOK
{
    NSLog(@"点击OK");
   
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self initNavBar];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    // 导航栏标题字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor blackColor]}];
    // 导航栏左右按钮字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
