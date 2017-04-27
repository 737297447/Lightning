//
//  NZLHorCellView.h
//  Lighting
//
//  Created by longhy on 2017/4/14.
//  Copyright © 2017年 longhy. All rights reserved.
//
// 自定义横向view ,可配置右边箭头显示隐藏,隐藏右边文字自动站位
//               右边显示UISwitch,隐藏箭头
//               右边显示文字
//
//

#import <UIKit/UIKit.h>

@interface NZLHorCellView : UIButton

//设置左边文字(默认颜色为34,34,34)
+(NZLHorCellView*) setTitle:(NSString*)titleText;
//设置左边文字和颜色
+(NZLHorCellView*) setTitle:(NSString*)titleText withColor:(UIColor*)color;




-(void) setRightText:(NSString*) rightText withColor:(UIColor*)textColor;
-(void) setRightImage:(UIImage*) rightImage;
//是否显示最右边的箭头,默认显示
-(void) isShowRight:(BOOL) isShow;
//是否显示最下边横线,默认显示
-(void) isShowLineView:(BOOL) isShow;
//TODO 是否显示最右边的Switch开关,默认不显示
-(void) isShowSwitch:(BOOL)isShow;


@end
