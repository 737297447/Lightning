//
//  NZLBaseNavViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBaseNavViewController.h"
#import "DYLeftSlipManager.h"
#import "NZLLeftMenuViewController.h"

@interface NZLBaseNavViewController ()

@end

@implementation NZLBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.view.layer.shadowOpacity = 1;
//    self.view.layer.shadowColor = [UIColor colorWithWhite:0 alpha:1].CGColor;
    
    
    [[DYLeftSlipManager sharedManager] setLeftViewController:[NZLLeftMenuViewController new] coverViewController:self];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
