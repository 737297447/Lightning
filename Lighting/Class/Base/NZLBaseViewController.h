//
//  NZLBaseViewController.h
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZLBaseViewController : UIViewController

//当为空view的时候,传入空view的图片名字
- (void)noContentUIWithImageNamed:(NSString *)named;

//左侧返回按钮事件,如果要处理特殊的,重写该方法
-(void)pressBarBtn;

@end
