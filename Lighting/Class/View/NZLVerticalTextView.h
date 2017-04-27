//
//  NZLVerticalTextView.h
//  Lighting
//
//  Created by longhy on 2017/4/26.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZLVerticalTextView : UIButton

@property(nonatomic,strong) UIButton* imageBtn;
@property(nonatomic,strong) UILabel* topLabel;
@property(nonatomic,strong) UILabel* labelBtn;


/**
 都是文字样式
 */
+(NZLVerticalTextView*) setTopText:(NSString*)topText setBottomText:
        (NSString*)bottomText;


/**
 将上面文字隐藏,图片显示,变成上图片下文字样式
 */
+(NZLVerticalTextView*) setTopImage:(NSString*)image setBottomText:
       (NSString*)bottomText;


/**
 如果顶部文字显示的时候
 设置顶部文字的大小
 
 @param textSize 文字大小
 */
-(void) setTopTextSize:(CGFloat)textSize withTextColor:(UIColor*)color;




@end
