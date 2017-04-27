//
//  NZLMessageCell.m
//  Lighting
//
//  Created by longhy on 2017/4/18.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMessageCell.h"

@interface NZLMessageCell()

@property(nonatomic,strong)UIImageView* pointView;
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* titleView;
@property(nonatomic,strong)UILabel* detailView;
@property(nonatomic,strong)UILabel* timeView;

@end


@implementation NZLMessageCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
        [self myLayout];
    }
    return self;
}


-(void)initUI
{
     self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.pointView = [[UIImageView alloc]initWithImage:[UIImage imageWithBgColor:RGB(70, 153, 255)]];
    [self.contentView addSubview:self.pointView];
    
    
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    self.titleView = [UILabel labelWithText:@"系统通知" textColor:RGB(34, 34, 34) font:15 textAliment:NSTextAlignmentLeft];
    [self.bgView addSubview:self.titleView];
    
    self.timeView = [UILabel labelWithText:@"2017-01-01" textColor:RGB(196, 196, 196) font:10 textAliment:NSTextAlignmentLeft];
    [self.bgView addSubview:self.timeView];
    
    self.detailView = [UILabel labelWithText:@"多久发货速度丰东股份很伤感的回复过水电费" textColor:RGB(153, 153, 153) font:12 textAliment:NSTextAlignmentLeft];
    [self.bgView addSubview:self.detailView];
    
    
}

-(void)myLayout
{
    
    self.pointView.sd_layout.leftSpaceToView(self.contentView, 7).topSpaceToView(self.contentView, 20)
    .widthIs(8).heightIs(8);
    self.pointView.layer.cornerRadius = self.pointView.height / 2;
    self.pointView.clipsToBounds = YES;
    
    self.bgView.sd_layout.leftSpaceToView(self.pointView, 10).rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10).heightIs(100);

    self.titleView.sd_layout.leftSpaceToView(self.bgView, 10).topSpaceToView(self.bgView, 10).autoHeightRatio(0);
    [self.titleView setSingleLineAutoResizeWithMaxWidth:200];
    
    self.timeView.sd_layout.rightSpaceToView(self.bgView, 10).centerYEqualToView(self.titleView).autoHeightRatio(0);
    [self.timeView setSingleLineAutoResizeWithMaxWidth:100];
    
    self.detailView.sd_layout.leftEqualToView(self.titleView).rightEqualToView(self.timeView).autoHeightRatio(0).topSpaceToView(self.titleView, 10);
    
    [self.bgView setupAutoHeightWithBottomView:self.detailView bottomMargin:10];
    
    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:0];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self deletaBtn];
}

-(void) deletaBtn
{
    for (UIView *subView in self.subviews){
        if([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
            CGRect cRect = subView.frame;
            cRect.size.height = self.contentView.frame.size.height - 10;
            cRect.origin.y = self.contentView.frame.origin.y + 10;
            subView.frame = cRect;
            
            UIView *confirmView=(UIView *)[subView.subviews firstObject];
            // 改背景颜色
            confirmView.backgroundColor=RGB(254, 85, 46);
            for(UIView *sub in confirmView.subviews){
                if([sub isKindOfClass:NSClassFromString(@"UIButtonLabel")]){
                    UILabel *deleteLabel=(UILabel *)sub;
                    // 改删除按钮的字体
                    deleteLabel.font=[UIFont boldSystemFontOfSize:15];
                    // 改删除按钮的文字
                    deleteLabel.text=@"删除";
                    
                }
            }
            break;
        }
    }
}


-(void)setMyData:(MessageData *)myData
{
    _myData = myData;
    
    if ([myData.pushType isEqualToString:@"1"]) {
        self.titleView.text = @"系统消息";
    }else{
        self.titleView.text = @"活动消息";
    }
    self.timeView.text = [FDDateFormatter interceptTimeStampFromStr:myData.gmtCreate];
    self.detailView.text = myData.content;
    
    switch (myData.status) {
        case 1:
            self.pointView.image = [UIImage imageWithBgColor:RGB(70, 153, 255)];
            break;
        default:
            self.pointView.image = [UIImage imageWithBgColor:RGB(168, 168, 168)];
            break;
    }

    
    
}




@end
