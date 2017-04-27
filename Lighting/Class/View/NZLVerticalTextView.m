//
//  NZLVerticalTextView.m
//  Lighting
//
//  Created by longhy on 2017/4/26.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLVerticalTextView.h"

@implementation NZLVerticalTextView

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
    self.imageBtn = [[UIButton alloc]init];
    self.imageBtn.userInteractionEnabled = NO;
    [self addSubview:self.imageBtn];
    self.imageBtn.hidden = YES;
    
    self.topLabel = [[UILabel alloc]init];
    self.topLabel.textColor = RGB(34, 34, 34);
    self.topLabel.font = [UIFont systemFontOfSize:12];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.topLabel];
    
    
    self.labelBtn = [[UILabel alloc]init];
    self.labelBtn.textColor = RGB(34, 34, 34);
    self.labelBtn.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.labelBtn];
    
    
    
}




-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = 21;
    
    self.imageBtn.sd_layout
    .widthIs(width).heightIs(width)
    .centerXEqualToView(self)
    .topEqualToView(self);

    
    self.topLabel.sd_layout.centerXEqualToView(self).topEqualToView(self)
    .autoHeightRatio(0);
    [self.topLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    if (self.imageBtn.hidden == YES) {
        self.labelBtn.sd_layout.topSpaceToView(self.topLabel, 9)
        .autoHeightRatio(0).centerXEqualToView(self);
    }else{
        self.labelBtn.sd_layout.topSpaceToView(self.imageBtn, 9)
        .autoHeightRatio(0).centerXEqualToView(self);
    }
  
    
    [self.labelBtn setSingleLineAutoResizeWithMaxWidth:100];
    
    [self setupAutoHeightWithBottomView:self.labelBtn bottomMargin:0];
}

+(NZLVerticalTextView *)setTopText:(NSString *)topText setBottomText:(NSString *)bottomText
{
    NZLVerticalTextView* view = [[NZLVerticalTextView alloc]init];
    view.imageBtn.hidden = YES;
    view.topLabel.hidden = NO;
    view.topLabel.text = topText;
    view.labelBtn.text =bottomText;
    
    return view;
    
}

+(NZLVerticalTextView *)setTopImage:(NSString *)image setBottomText:(NSString *)bottomText
{
    NZLVerticalTextView* view = [[NZLVerticalTextView alloc]init];
    
    view.imageBtn.hidden = NO;
    view.topLabel.hidden = YES;
    view.labelBtn.text = bottomText;
    [view.imageBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    return view;
}



-(void)setTopTextSize:(CGFloat)textSize withTextColor:(UIColor*)color
{
    self.topLabel.font = [UIFont systemFontOfSize:textSize];
    self.topLabel.textColor = [UIColor whiteColor];
    self.topLabel.alpha = 0.9;
    self.labelBtn.textColor = [UIColor whiteColor];
    self.labelBtn.alpha = 0.7;
}



@end
