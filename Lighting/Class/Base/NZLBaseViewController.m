//
//  NZLBaseViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBaseViewController.h"

@interface NZLBaseViewController ()

@end

@implementation NZLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(240, 240, 240);
    
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"goback"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBarBtn)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    
}



- (void)noContentUIWithImageNamed:(NSString *)named{
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:named]];
    [imageView sizeToFit];
    imageView.centerX = SCREEN_WIDTH/2;
    imageView.y = 304 * SCALE;
    [self.view addSubview:imageView];
    
    
}



-(void)pressBarBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
