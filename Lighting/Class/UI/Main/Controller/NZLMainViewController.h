//
//  NZLMainViewController.h
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBaseViewController.h"
#import "NZLBanner.h"
#import "SDCycleScrollView.h"

@interface NZLMainViewController : NZLBaseViewController<SDCycleScrollViewDelegate>

/**
 *  banner数据
 */
@property(nonatomic,strong)NZLBanner* banner;


@end
