//
//  NZLHeaderView.h
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NZLHeaderView;

typedef NS_ENUM(NSInteger,NZLHeaderType)
{
    NZLHeaderTypeUserIcon = 101,
    NZLHeaderTypeLogin = 102,
    NZLHeaderTypePeopleCenter = 103
    
};

//typedef void(^HeaderBlock)(NZLHeaderView* headerView,NZLHeaderType type);

@interface NZLHeaderView : UIView

//@property(nonatomic,copy) HeaderBlock black;

@end
