//
//  NZLBottonCellView.m
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBottonCellView.h"

@interface NZLBottonCellView()

@property(nonatomic,strong) UIImageView* iconView;
@property(nonatomic,strong) UILabel* cellTextLabel;
@property(nonatomic,strong) UIView* endLineView;
@property(nonatomic,strong) UIButton* numBtn;



@end

@implementation NZLBottonCellView


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
    
    
    self.iconView = [[UIImageView alloc]init];
    [self addSubview:self.iconView];
    
    self.cellTextLabel = [[UILabel alloc]init];
    self.cellTextLabel.textColor = RGB(34, 34, 34);
    self.cellTextLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.cellTextLabel];
    
    
    self.endLineView = [[UIView alloc]init];
    self.endLineView.backgroundColor = RGB(155, 155, 155);
    [self addSubview:self.endLineView];
    
    self.numBtn = [[UIButton alloc]init];
    self.numBtn.backgroundColor = [UIColor redColor];
    self.numBtn.titleLabel.font = [UIFont systemFontOfSize:8];
    [self.numBtn setTintColor:[UIColor whiteColor]];
    self.numBtn.hidden = YES;
    self.numBtn.userInteractionEnabled = NO;
    [self addSubview:self.numBtn];
    
}

+(NZLBottonCellView*)setImage:(UIImage*) image withText:(NSString*)text
{
    NZLBottonCellView* cellView = [[NZLBottonCellView alloc]init];
    
    [cellView.iconView setImage:image];
    cellView.cellTextLabel.text = text;
    
    return cellView;
}

-(void)setMessage:(NSString *)num
{
    if ([num isEqualToString:@"0"]) {
        self.numBtn.hidden = YES;
    }else{
        self.numBtn.hidden = NO;
        [self.numBtn setTitle:num forState:UIControlStateNormal];
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = 21;
    
    self.iconView.sd_layout.widthIs(width).heightEqualToWidth().leftSpaceToView(self, 14)
    .centerYEqualToView(self);
    
    self.cellTextLabel.sd_layout.leftSpaceToView(self.iconView, 15).centerYEqualToView(self).autoHeightRatio(0);
    [self.cellTextLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.numBtn.sd_layout.rightSpaceToView(self, 20)
    .centerYEqualToView(self).widthIs(20).heightIs(20);
    self.numBtn.layer.cornerRadius = self.numBtn.height / 2;
    self.numBtn.clipsToBounds = YES;
    
    
    self.endLineView.sd_layout.bottomEqualToView(self).heightIs(0.5).rightSpaceToView(self, 20).leftEqualToView(self.cellTextLabel);
    
    
}



@end
