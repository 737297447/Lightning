//
//  UIImage+FDImage.h
//  FuDai
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 fudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FDImage)

+ (UIImage *)imageWithBgColor:(UIColor *)color;

+ (UIImage *)rendImageWithView:(UIView*)view;

@end
