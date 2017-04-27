//
//  NZLAboutViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/16.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLAboutViewController.h"
#import "NZLHorCellView.h"

@interface NZLAboutViewController ()

@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong)UIImageView* logoView;
@property(nonatomic,strong)UILabel* valueLabel;

@property(nonatomic,strong)NZLHorCellView* oneView;
@property(nonatomic,strong)NZLHorCellView* twoView;
@property(nonatomic,strong)NZLHorCellView* threeView;


@end

@implementation NZLAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


-(void)initUI
{
    
    self.view.backgroundColor = RGB(240, 240, 240);
    
    self.title = @"关于我们";
    
    self.topView = [[UIView alloc]init];
    self.topView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topEqualToView(self.view).heightIs(120);
    
    
    self.logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_app"]];
    [self.topView addSubview:self.logoView];
    
    self.valueLabel = [[UILabel alloc]init];
    self.valueLabel.textColor = RGB(34, 34, 34);
    self.valueLabel.text = @"版本:1.0.3";
    self.valueLabel.font = [UIFont systemFontOfSize:12];
    [self.topView addSubview:self.valueLabel];
    [self.view addSubview:self.topView];
    
    
    self.logoView.sd_layout.widthIs(80).heightIs(80)
    .topSpaceToView(self.topView, 10).centerXEqualToView(self.view);
    
    self.valueLabel.sd_layout.autoHeightRatio(0).topSpaceToView(self.logoView, 5)
    .centerXEqualToView(self.view);
    [self.valueLabel setSingleLineAutoResizeWithMaxWidth:100];

    
    
    
    self.oneView = [NZLHorCellView setTitle:@"引导页"];
    self.twoView = [NZLHorCellView setTitle:@"版本更新"];
    [self.twoView setRightText:@"最新版本" withColor:RGB(153, 153, 153)];
    self.threeView = [NZLHorCellView setTitle:@"关于闪贷侠"];
    [self.threeView isShowLineView:NO];
    
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.view addSubview:self.threeView];
    
    self.oneView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.topView, 0).heightIs(50);
    self.twoView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.oneView, 0).heightIs(50);
    self.threeView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.twoView, 0).heightIs(50);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
