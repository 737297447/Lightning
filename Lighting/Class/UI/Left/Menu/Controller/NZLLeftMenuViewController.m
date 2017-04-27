//
//  NZLLeftMenuViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLLeftMenuViewController.h"
#import "NZLHeaderView.h"
#import "NZLBottomView.h"
#import "NZLPeopleCenterViewController.h"



@interface NZLLeftMenuViewController ()

@property(nonatomic,strong) NZLHeaderView* headerView;
@property(nonatomic,strong) NZLBottomView* bottomView;


@end

@implementation NZLLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
}

-(void)initUI
{
    CGFloat width = self.view.width *0.8;
    CGFloat height = (width * 585) / 903;
    
    self.headerView = [[NZLHeaderView alloc]init];
    self.headerView.frame = CGRectMake(0, 0,width , height);
    [self.view addSubview:self.headerView];
    
    self.bottomView = [[NZLBottomView alloc]init];
    self.bottomView.frame = CGRectMake(0, self.headerView.height, width, self.view.height - height);
    [self.view addSubview:self.bottomView];
    
    
    
    
    
//    @weakify(self)
//    self.headerView.black = ^(NZLHeaderView *headerView, NZLHeaderType type) {
//        @strongify(self)
//     
//    };
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
