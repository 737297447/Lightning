//
//  NZLBaseHandler.h
//  Lighting
//
//  Created by longhy on 2017/4/17.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <Foundation/Foundation.h>

//处理完成事件
typedef void(^CompleteBlock)();

//处理事件成功
typedef void(^SuccessBlock)(id obj);

//处理事件错误
typedef void(^FailedBlock)(id obj);


@interface NZLBaseHandler : NSObject



@end
