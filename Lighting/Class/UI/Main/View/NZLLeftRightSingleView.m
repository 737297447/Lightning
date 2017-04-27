//
//  NZLLeftRightSingleView.m
//  Lighting
//
//  Created by longhy on 2017/4/25.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLLeftRightSingleView.h"


@interface NZLLeftRightSingleView()

@property(nonatomic,strong)UIImageView* leftView;
@property(nonatomic,strong)UILabel* rightLabel;

@end

@implementation NZLLeftRightSingleView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void) initUI
{
    self.leftView = [[UIImageView alloc]init];
    [self addSubview:self.leftView];
    
    self.rightLabel = [UILabel labelWithText:@"" textColor:RGB(34, 34, 34) font:12 textAliment:NSTextAlignmentCenter];
    [self addSubview:self.rightLabel];
    
    self.leftView.sd_layout.leftEqualToView(self).centerYEqualToView(self).widthIs(15).heightEqualToWidth();
    
    self.rightLabel.sd_layout.leftSpaceToView(self.leftView, 5).centerYEqualToView(self).autoHeightRatio(0);
    [self.rightLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    [self setupAutoHeightWithBottomView:self.rightLabel bottomMargin:0];
    
}

+(NZLLeftRightSingleView *)setImage:(NSString *)img setTitle:(NSString *)text
{
    NZLLeftRightSingleView* singView = [[NZLLeftRightSingleView alloc]init];
    [singView.leftView setImage:[UIImage imageNamed:img]];
    
    singView.rightLabel.text = text;
    
    
    return singView;
}


@end
