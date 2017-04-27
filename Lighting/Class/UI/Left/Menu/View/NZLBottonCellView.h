//
//  NZLBottonCellView.h
//  Lighting
//
//  Created by longhy on 2017/4/13.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZLBottonCellView : UIButton


+(NZLBottonCellView*) setImage:(UIImage*) image withText:(NSString*)text;

-(void) setMessage:(NSString*) num;

@end
