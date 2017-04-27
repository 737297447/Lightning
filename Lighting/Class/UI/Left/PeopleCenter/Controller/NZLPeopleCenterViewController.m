//
//  NZLPeopleCenterViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/14.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLPeopleCenterViewController.h"
#import "NZLHorCellView.h"
#import "DYLeftSlipManager.h"


@interface NZLPeopleCenterViewController ()

@property(nonatomic,strong)NZLHorCellView* oneView;

@property(nonatomic,strong)NZLHorCellView* twoView;
@property(nonatomic,strong)NZLHorCellView* threeView;
@property(nonatomic,strong)NZLHorCellView* fourView;
@property(nonatomic,strong)NZLHorCellView* fiveView;

@end

@implementation NZLPeopleCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(240, 240, 240);
    
    
    [self initUI];
    [self initData];
    
}

-(void) initUI
{
    
    self.title = @"个人中心";
    
    
    
    self.oneView = [NZLHorCellView setTitle:@"个人头像"];
    self.oneView.tag = 101;
    
    
    self.twoView = [NZLHorCellView setTitle:@"身份信息"];
    self.twoView.tag = 102;
    self.threeView = [NZLHorCellView setTitle:@"人际关系"];
    self.threeView.tag = 103;
    self.fourView = [NZLHorCellView setTitle:@"手机"];
    self.fiveView = [NZLHorCellView setTitle:@"银行卡"];
    self.fiveView.tag = 105;
    
    [self.oneView addTarget:self action:@selector(pressItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.twoView addTarget:self action:@selector(pressItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeView addTarget:self action:@selector(pressItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.fiveView addTarget:self action:@selector(pressItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.view addSubview:self.threeView];
    [self.view addSubview:self.fourView];
    [self.view addSubview:self.fiveView];
    
    
    
    
    
    
    CGFloat nonaHeight = 50;
    
    self.oneView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.view, 10).heightIs(60);
    [self.oneView setRightImage:[UIImage imageNamed:@"small_headicon"]];
    [self.oneView isShowLineView:NO];
    
    
    self.twoView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.oneView, 10).heightIs(nonaHeight);
    

    [self.twoView setRightText:@"李晓贺" withColor:RGB(153, 153, 153)];
    
    self.threeView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.twoView, 0).heightIs(nonaHeight);
    [self.threeView setRightText:@"李妈妈" withColor:RGB(34, 34, 34)];
    
    self.fourView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.threeView, 0).heightIs(nonaHeight);
    [self.fourView setRightText:@"137****9999" withColor:RGB(153, 153, 153)];
    [self.fourView isShowRight:NO];
    
    self.fiveView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.fourView, 0).heightIs(nonaHeight);
    [self.fiveView setRightText:@"6214 **** **** 1139" withColor:RGB(34, 34, 34)];
    [self.fiveView isShowLineView:NO];
    
}

-(void) initData
{
    
}

-(void)pressBarBtn
{
    [[DYLeftSlipManager sharedManager] showLeftView];
}


-(void)pressItem:(UIButton*)btn
{
    switch (btn.tag) {
        case 101:
            NSLog(@"101");
            break;
        case 102:
            NSLog(@"102");
            break;
        case 103:
            NSLog(@"103");
            break;
        case 105:
            NSLog(@"105");
            break;
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
