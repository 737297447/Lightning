//
//  NZLMacros.h
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#ifndef NZLMacros_h
#define NZLMacros_h


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGB(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]

#define FDRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]


#define SCALE (SCREEN_WIDTH/750.0)


#define NZLNotification [NSNotificationCenter defaultCenter]

#define LEFT_MENU_TOP @"LeftMenuTop"
#define LEFT_MENU_TOP_KET @"LeftMenuTopKey"

#define LEFT_MENU_BOTTOM @"LeftMenuBottom"
#define LEFT_MENU_BOTTOM_KET @"LeftMenuBottomKey"










#endif /* NZLMacros_h */
