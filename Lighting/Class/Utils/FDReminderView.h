//
//  FDReminderView.h
//  FuDai
//
//  Created by Apple on 16/8/25.
//  Copyright © 2016年 fudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDReminderView : UIView

+ (void)showWithString:(NSString *)str;

+ (UIImageView *)viewWithImageNamed:(NSString *)imageNamed andParentView:(UIView *)view andY:(CGFloat)y;

@end
