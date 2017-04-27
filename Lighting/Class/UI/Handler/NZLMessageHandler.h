//
//  NZLMessageHandler.h
//  Lighting
//
//  Created by longhy on 2017/4/17.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLBaseHandler.h"

@interface NZLMessageHandler : NZLBaseHandler

+(void) HDGetMessage:(NSInteger) pageNum
              userId:(NSString*) userId
             success:(SuccessBlock)success
              failed:(FailedBlock)failed;

+(void) HDDeleteMessage:(NSString *)ID
                success:(SuccessBlock)success
                 failed:(FailedBlock)failed;

+(void) HDReadMessage:(NSString*)ID
              success:(SuccessBlock)success
               failed:(FailedBlock)failed;

@end
