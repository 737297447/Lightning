//
//  NZLSeekbar.h
//  Lighting
//
//  Created by longhy on 2017/4/20.
//  Copyright © 2017年 longhy. All rights reserved.
//  拖动条,
//

#import <UIKit/UIKit.h>

@protocol NZLSeekbarDelegate <NSObject>

-(void)seekBarRangeText:(NSString*)rangeText;

@end

@interface NZLSeekbar : UIView

@property(nonatomic,weak) id<NZLSeekbarDelegate> delegate;

-(void)setPosition:(NSInteger) position;



@end
