//
//  NZLSettingViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/16.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLSettingViewController.h"
#import "DYLeftSlipManager.h"
#import "NZLHorCellView.h"
#import "NZLAboutViewController.h"


@interface NZLSettingViewController ()

@property(nonatomic,strong)NZLHorCellView* oneView;
@property(nonatomic,strong)NZLHorCellView* twoView;
@property(nonatomic,strong)NZLHorCellView* threeView;

@property(nonatomic,strong)UIButton* loginOutBtn;

@end

@implementation NZLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];

}

-(void)initUI
{
    self.view.backgroundColor = RGB(240, 240, 240);
    
    self.title = @"设置";
    
    self.oneView = [NZLHorCellView setTitle:@"手势密码"];
    self.oneView.tag = 101;
    [self.oneView isShowSwitch:YES];
    
    
    self.twoView = [NZLHorCellView setTitle:@"密码修改"];
    self.twoView.tag = 102;
    [self.twoView isShowLineView:NO];
    
    self.threeView = [NZLHorCellView setTitle:@"关于我们"];
    self.threeView.tag = 103;
    [self.threeView isShowLineView:NO];
    
    self.loginOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginOutBtn setTitle:@"退出" forState:UIControlStateNormal];
    [self.loginOutBtn setTintColor:[UIColor redColor]];
    self.loginOutBtn.tag = 104;
    self.loginOutBtn.backgroundColor = [UIColor whiteColor];
    

    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.view addSubview:self.threeView];
    [self.view addSubview:self.loginOutBtn];
    [self.oneView addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.twoView addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeView addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginOutBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.oneView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topSpaceToView(self.view, 10)
    .heightIs(50);
    
    self.twoView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topSpaceToView(self.oneView, 0)
    .heightIs(50);
    
    self.threeView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topSpaceToView(self.twoView, 10)
    .heightIs(50);
    
    self.loginOutBtn.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topSpaceToView(self.threeView, 50)
    .heightIs(60);
    
    
}





-(void)pressBarBtn
{
    [[DYLeftSlipManager sharedManager] showLeftView];
}

-(void)clickMenu:(UIButton*) btn
{
    switch (btn.tag) {
        case 101:
            
            break;
        case 102:
            
            break;
        case 103:
            [self.navigationController pushViewController:[[NZLAboutViewController alloc]init] animated:YES];
            
            break;
        case 104:
            
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
