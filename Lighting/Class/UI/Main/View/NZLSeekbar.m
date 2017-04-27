//
//  NZLSeekbar.m
//  Lighting
//
//  Created by longhy on 2017/4/20.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLSeekbar.h"

@interface NZLSeekbar()<UIGestureRecognizerDelegate>

@property(nonatomic,assign)CGFloat oneBgWidth;//背景蓝色的宽度动态变化

@property(nonatomic,strong)UIImageView* grayBgView;//背景灰色
@property(nonatomic,strong)UIImageView* blueBgView;//背景蓝色
@property(nonatomic,assign)CGFloat blueBgWidth;//背景蓝色的宽度动态变化
@property(nonatomic,assign)NSInteger bgHeight;//背景的高度



@property(nonatomic,strong)UIButton* seekBarView;//拖动按钮
@property(nonatomic,assign)CGFloat seekBarCenterX;//背景蓝色的宽度动态变化
@property(nonatomic,strong)UILabel* topLabel;//拖动按钮顶部文字
@property(nonatomic,assign)NSInteger topTextSize;//顶部文字大小
@property(nonatomic,copy)NSString* topText;//顶部显示文字


@property(nonatomic,strong)UILabel* keduLabel;//刻度 |
@property(nonatomic,strong)UILabel* keduTextLabel;//刻度底部文字
@property(nonatomic,strong)NSMutableArray* keduLabelArray;
@property(nonatomic,strong)NSMutableArray* centerArray;
@property(nonatomic,strong)NSMutableArray* keduLabelTextArray;


@property(nonatomic,strong)NSArray* array;//刻度的值
@property(nonatomic,strong)UILongPressGestureRecognizer* longGesture;//长按手势


@end


@implementation NZLSeekbar


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
    
    self.array = [NSArray arrayWithObjects:@"500",@"600",@"700",@"800",@"900",@"1000", nil];
    self.bgHeight = 10;
    self.blueBgWidth = self.bgHeight * 3 / 2;
    self.seekBarCenterX = self.bgHeight * 3 / 2 + 20;
    
    
    self.keduLabelArray = [NSMutableArray array];
    self.keduLabelTextArray = [NSMutableArray array];
    self.centerArray = [NSMutableArray array];
    
    self.grayBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"progress-bar"]];
    [self addSubview:self.grayBgView];
    
    self.blueBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_progressbar"]];
    [self addSubview:self.blueBgView];
    
    self.seekBarView = [UIButton buttonWithImage:@"btn_-round" backImageNamed:@""];
    [self addSubview:self.seekBarView];
    
    self.topText = @"500";
    self.topTextSize = 22;
    
    self.topLabel = [UILabel labelWithText:self.topText textColor:RGB(255, 132, 0) font:self.topTextSize  textAliment:NSTextAlignmentCenter];
    [self addSubview:self.topLabel];
    
    
    for (NSInteger i = 0; i < self.array.count; i++) {
        
        self.keduLabel = [UILabel labelWithText:@"|" textColor:RGB(153, 153, 153) font:11 textAliment:NSTextAlignmentCenter];
        [self addSubview:self.keduLabel];
        [self.keduLabelArray addObject:self.keduLabel];
        
        self.keduTextLabel = [UILabel labelWithText:self.array[i] textColor:RGB(153, 153, 153) font:11 textAliment:NSTextAlignmentCenter];
        [self addSubview:self.keduTextLabel];
        [self.keduLabelTextArray addObject:self.keduTextLabel];
        
    }
    
    self.longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressMove:)];
    self.longGesture.delegate = self;
    self.longGesture.minimumPressDuration = 0.02;
    [self addGestureRecognizer:self.longGesture];
    
    
    [self layouts];
    
}


-(void)layouts
{
    
    self.grayBgView.sd_layout.leftSpaceToView(self, 20).rightSpaceToView(self, 35)
    .centerYEqualToView(self).heightIs(self.bgHeight);
    
    self.seekBarView.sd_layout.centerYEqualToView(self.grayBgView).centerXIs(self.seekBarCenterX).widthIs(self.bgHeight* 3).heightEqualToWidth();
    
    self.blueBgView.sd_layout.centerYEqualToView(self.grayBgView).heightIs(self.bgHeight).widthIs(self.blueBgWidth).leftSpaceToView(self.grayBgView, -(self.seekBarView.width / 2 + self.grayBgView.width) );
    
    
    self.blueBgView.layer.cornerRadius = self.blueBgView.height / 2;
    self.blueBgView.clipsToBounds = YES;
    
    
    self.topLabel.sd_layout.heightIs(30).topSpaceToView(self.seekBarView, -(self.seekBarView.height  + 35) ).centerXEqualToView(self.seekBarView);
    [self.topLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.oneBgWidth = self.grayBgView.width / (self.array.count - 1);
    
    for (NSInteger i = 0; i < self.array.count; i++) {
        
        UILabel* kedu =self.keduLabelArray[i];
        kedu.sd_layout.topSpaceToView(self.seekBarView, 5).autoHeightRatio(0)
        .leftSpaceToView(self.grayBgView, self.oneBgWidth * i - self.grayBgView.width);
        [kedu setSingleLineAutoResizeWithMaxWidth:50];
        
        UILabel* keduLabel =self.keduLabelTextArray[i];
        keduLabel.sd_layout.topSpaceToView(kedu, 5).autoHeightRatio(0)
        .centerXEqualToView(kedu);
        [keduLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        
        CGFloat centerX = kedu.right +self.oneBgWidth / 2;
        NSNumber* number = [NSNumber numberWithFloat:centerX];
        
        [self.centerArray addObject:number];
        
    }
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.blueBgView.sd_layout.widthIs(self.blueBgWidth);
    self.seekBarView.centerX = self.seekBarCenterX;
    self.topLabel.centerX = self.seekBarCenterX;
    self.topLabel.font = [UIFont systemFontOfSize:self.topTextSize];
    
    
}

-(void)longPressMove:(id)sender
{
    
    
    UITouch* touch = sender;
    
    CGPoint point = [touch locationInView:self];
    if (point.x < self.grayBgView.left) {
        self.topTextSize = 22;
        [self setPosition: 0];
        [self setNeedsLayout];
        NSLog(@"左边超出范围");
        
        if ([self.delegate respondsToSelector:@selector(seekBarRangeText:)]) {
            [self.delegate seekBarRangeText:self.topText];
        }

        return;
    }
    if (point.x > self.grayBgView.right) {
        self.topTextSize = 22;
        [self setPosition: self.array.count - 1];
        [self setNeedsLayout];
        NSLog(@"右边超出范围");
        
        if ([self.delegate respondsToSelector:@selector(seekBarRangeText:)]) {
            [self.delegate seekBarRangeText:self.topText];
        }
        
        return;
    }

    
    
    
//    NSLog(@"拖拽的距离:%f",point.x);
    
    
    if (point.x <  20 + self.seekBarView.width / 2) {
        point.x = 20 + self.seekBarView.width / 2;
    }
    
    
    CGFloat marLetf = 20 + self.seekBarView.width / 2;
    CGFloat x = point.x -  marLetf;
    //当前的位置,可以用于判断当前的位置是否超过0.5,超过自动滑到下一行
    CGFloat position = x / self.oneBgWidth ;
//    NSLog(@"dangqian position = %f",position);
    
    self.seekBarCenterX = point.x;
    self.blueBgWidth = self.seekBarCenterX - self.seekBarView.width / 2;
    self.topLabel.text = self.topText;
    [self setNeedsLayout];
    
    
    
    
    
    __block CGFloat distance;
    if (position <= 0.5) {
        distance = marLetf;
        self.topText = @"500";
    }else if(position > 0.5 && position <= 1.5){
        distance = marLetf + self.oneBgWidth;
        self.topText = @"600";
    }else if(position > 1.5 && position <= 2.5){
        distance = marLetf + self.oneBgWidth * 2;
        self.topText = @"700";
    }else if(position > 2.5 && position <= 3.5){
        distance = marLetf + self.oneBgWidth * 3;
        self.topText = @"800";
    }else if(position > 3.5 && position <= 4.5){
        distance = marLetf + self.oneBgWidth * 4;
        self.topText = @"900";
    }else if(position > 4.5){
        distance = marLetf + self.oneBgWidth * 5;
        self.topText = @"1000";
    }

    
    UILongPressGestureRecognizer* recognizer = sender;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.topTextSize = 32;
    }else if (recognizer.state == UIGestureRecognizerStateEnded) {
        self.topTextSize = 22;
        
        
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.seekBarCenterX = distance;
            self.blueBgWidth = self.seekBarCenterX - self.seekBarView.width / 2;
            self.blueBgView.sd_layout.widthIs(self.blueBgWidth);
            self.seekBarView.centerX = self.seekBarCenterX;
            NSLog(@"self.seekBarView.centerX = %f",self.seekBarCenterX);
            
        }];
        
        self.topLabel.text = self.topText;
        
        if ([self.delegate respondsToSelector:@selector(seekBarRangeText:)]) {
            [self.delegate seekBarRangeText:self.topText];
        }
        
    }else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        NSInteger intText = 500 + 100 * position;
        
        self.topText = [NSString stringWithFormat:@"%ld",intText];
        
        
//        if (position <= 0.5) {
//            self.topText = @"500";
//        }else if(position > 0.5 && position <= 1.5){
//            self.topText = @"600";
//        }else if(position > 1.5 && position <= 2.5){
//            self.topText = @"700";
//        }else if(position > 2.5 && position <= 3.5){
//            self.topText = @"800";
//        }else if(position > 3.5 && position <= 4.5){
//            self.topText = @"900";
//        }else if(position > 4.5){
//            self.topText = @"1000";
//        }
        
    }
    
    
    
    
}


/**
 设置seekbar的位置,

 @param position 当前的位置参数,整形
 */
-(void)setPosition:(NSInteger)position
{
    if (position >= self.array.count || position < 0) {
        return;
    }
    
    CGFloat marLetf = 20 + self.seekBarView.width / 2;
    self.seekBarCenterX = marLetf + self.oneBgWidth * position;
    NSInteger intText = 500 + 100 * position;
    self.topText = [NSString stringWithFormat:@"%ld",intText];
    self.blueBgWidth = self.seekBarCenterX - self.seekBarView.width / 2;
    self.blueBgView.sd_layout.widthIs(self.blueBgWidth);
    self.seekBarView.centerX = self.seekBarCenterX;
    self.topLabel.text = self.topText;
    
    if ([self.delegate respondsToSelector:@selector(seekBarRangeText:)]) {
        [self.delegate seekBarRangeText:self.topText];
    }

}





@end
