//
//  NZLHorCellView.m
//  Lighting
//
//  Created by longhy on 2017/4/14.
//  Copyright © 2017年 longhy. All rights reserved.
//
//
//

#import "NZLHorCellView.h"

@interface NZLHorCellView()

@property(nonatomic,strong)UILabel* leftLabel;
@property(nonatomic,strong)UILabel* rightLabel;
@property(nonatomic,strong)UIImageView* rightImageView;
@property(nonatomic,strong)UIImageView* arrowImageView;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UISwitch* switchView;


@property(nonatomic,assign)CGFloat rightMar;




@end


@implementation NZLHorCellView

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
    self.backgroundColor = [UIColor whiteColor];
    
    self.rightMar = 10;
    
    self.leftLabel = [[UILabel alloc]init];
    self.leftLabel.textColor = RGB(34, 34, 34);
    self.leftLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.leftLabel];
    
    self.rightLabel = [[UILabel alloc]init];
    self.rightLabel.font = [UIFont systemFontOfSize:15];
    self.rightLabel.hidden = YES;
    [self addSubview:self.rightLabel];
    
    
    self.rightImageView = [[UIImageView alloc]init];
    self.rightImageView.hidden = YES;
    [self addSubview:self.rightImageView];
    
    self.arrowImageView = [[UIImageView alloc]init];
    [self.arrowImageView setImage:[UIImage imageNamed:@"icon_next"]];
    [self addSubview:self.arrowImageView];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = RGB(196, 196, 196);
    [self addSubview:self.lineView];
    
    
    self.switchView = [[UISwitch alloc]init];
    self.switchView.hidden = YES;
    [self addSubview:self.switchView];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftLabel.sd_layout.leftSpaceToView(self, 7)
    .centerYEqualToView(self).autoHeightRatio(0);
    [self.leftLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.arrowImageView.sd_layout.rightSpaceToView(self, 7)
    .centerYEqualToView(self).heightIs(15).widthIs(7.5);
    
    self.rightLabel.sd_layout.rightSpaceToView(self.arrowImageView, self.rightMar)
    .centerYEqualToView(self).autoHeightRatio(0);
    [self.rightLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.switchView.sd_layout.rightSpaceToView(self.arrowImageView,self.rightMar)
    .centerYEqualToView(self);
    
    
    self.rightImageView.sd_layout.rightSpaceToView(self.arrowImageView, 10)
    .centerYEqualToView(self).widthIs(40).heightIs(40);
    self.rightImageView.layer.cornerRadius = self.rightImageView.height / 2;
    self.rightImageView.clipsToBounds = YES;
    
    
    self.lineView.sd_layout.heightIs(0.5).leftEqualToView(self.leftLabel)
    .rightEqualToView(self.arrowImageView).bottomEqualToView(self);
    
    
}

+(NZLHorCellView*) setTitle:(NSString*)titleText
{
    NZLHorCellView* cell = [[NZLHorCellView alloc]init];
    cell.leftLabel.text = titleText;
    return cell;
}

+(NZLHorCellView*) setTitle:(NSString*)titleText withColor:(UIColor*)color
{
    NZLHorCellView* cell = [[NZLHorCellView alloc]init];
    cell.leftLabel.text = titleText;
    cell.leftLabel.textColor = color;
    return cell;

}


-(void)setRightText:(NSString *)rightText withColor:(UIColor*)textColor
{
    self.rightLabel.hidden = NO;
    self.rightLabel.text = rightText;
    self.rightLabel.textColor = textColor;
}

-(void)setRightImage:(UIImage *)rightImage
{
    self.rightImageView.hidden = NO;
    [self.rightImageView setImage:rightImage];
}

-(void)isShowRight:(BOOL)isShow
{
    self.arrowImageView.hidden = !isShow;
    self.rightMar = -7.5;
    
    [self setNeedsLayout];
    
}

-(void)isShowLineView:(BOOL)isShow
{
    self.lineView.hidden = !isShow;
}
-(void)isShowSwitch:(BOOL)isShow
{
    self.switchView.hidden = !isShow;
    self.arrowImageView.hidden = isShow;
    self.rightMar = -7.5;
    
    [self setNeedsLayout];
}

@end
