//
//  NZLMessageHandler.m
//  Lighting
//
//  Created by longhy on 2017/4/17.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMessageHandler.h"
#import "HttpTool.h"
#import "MessageData.h"


@implementation NZLMessageHandler

+(void)HDGetMessage:(NSInteger)pageNum userId:(NSString *)userId success:(SuccessBlock)success failed:(FailedBlock)failed
{
    NSDictionary *dict = @{
                           @"userId":userId,
                           @"pageNo":[NSString stringWithFormat:@"%@",@(pageNum)],
                           @"pageSize":PAGE_SIZE_MY
                           };
    
    [HttpTool postWithPath:URL_MESSAGE params:dict success:^(id json) {
        
        NSLog(@"%@", json);
        
        
        NSArray* data = [MessageData mj_objectArrayWithKeyValuesArray:json[@"data"]];
        
        if (data) {
            success(data);
        }else {
            failed(json);
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
    
}


+(void)HDDeleteMessage:(NSString *)ID success:(SuccessBlock)success failed:(FailedBlock)failed
{
    
    NSDictionary *dict = @{
                           @"id":ID
                           };

    [HttpTool postWithPath:URL_MESSAGE_DELETE params:dict success:^(id json) {
        
        
        
        NSNumber* code = (NSNumber*)json[@"code"];
        
        NSLog(@"code - %@",code);
        
        if ([code isEqual:CODE_SUCCESS]) {
            
            NSLog(@"delete success");
            
            success(code);
        }else {
            failed(json);
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];

    
}

+(void)HDReadMessage:(NSString *)ID success:(SuccessBlock)success failed:(FailedBlock)failed
{
    NSDictionary* dict = @{@"id":ID};
    [HttpTool postWithPath:URL_MESSAGE_READ params:dict success:^(id json) {
        
        NSLog(@"当前已读%@", json);
        NSNumber* code = (NSNumber*)json[@"code"];

        NSLog(@"read code - %@",code);
        if ([code isEqual:CODE_SUCCESS]) {
            success(code);
        }else{
        failed(json);
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
    
}


@end
