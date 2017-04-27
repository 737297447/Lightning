//
//  NZLNumView.m
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLNumView.h"

@implementation NZLNumView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    CGFloat font = 24 * SCALE;
    
    UILabel* numLb = [[UILabel alloc]init];
    self.numLb = numLb;
    numLb.textAlignment = NSTextAlignmentCenter;
    numLb.textColor = [UIColor whiteColor];
    numLb.font = [UIFont systemFontOfSize:font];
    [self addSubview:numLb];
    
    
    UILabel* desLb = [[UILabel alloc]init];
    self.desLb = desLb;
    desLb.textAlignment = NSTextAlignmentCenter;
    desLb.textColor = [UIColor whiteColor];
    desLb.font = [UIFont systemFontOfSize:font];
    [self addSubview:desLb];
    
    
    
}


+(NZLNumView *)numberWithNumFont:(CGFloat)numFount withColor:(UIColor *)numColor withDesFont:(CGFloat)desFont withDesColor:(UIColor *)desColor
{
    NZLNumView* numView = [[NZLNumView alloc]init];
    
    numView.numLb.font = [UIFont systemFontOfSize:numFount];
    numView.numLb.textColor = numColor;
    
    numView.desLb.font = [UIFont systemFontOfSize:desFont];
    numView.desLb.textColor = desColor;
    
    return numView;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.numLb.sd_layout.centerXEqualToView(self).heightIs(20);
    
    [self.numLb setSingleLineAutoResizeWithMaxWidth:100];
    
    self.desLb.sd_layout.centerXEqualToView(self).heightIs(20)
    .topSpaceToView(self.numLb, 10);
    
    [self.desLb setSingleLineAutoResizeWithMaxWidth:100];
    
}


@end
