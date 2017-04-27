//
//  NZLNumView.h
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZLNumView : UIView

@property(nonatomic,strong) UILabel* numLb;

@property(nonatomic,strong) UILabel* desLb;

+(NZLNumView*) numberWithNumFont:(CGFloat)numFount withColor:(UIColor*)numColor
                     withDesFont:(CGFloat)desFont withDesColor:(UIColor*) desColor;

@end
