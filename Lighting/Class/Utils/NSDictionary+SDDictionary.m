//
//  NSDictionary+SDDictionary.m
//  YPReusableController
//
//  Created by 余艾星 on 17/2/15.
//  Copyright © 2017年 tyiti. All rights reserved.
//

#import "NSDictionary+SDDictionary.h"

@implementation NSDictionary (SDDictionary)

- (NSString *)sort:(NSDictionary *)dict{
    
        NSMutableString *str = [[NSMutableString alloc] init];
        
        //value数组
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
            
            [array addObject:key];
            
        }];
        
        NSArray *array1 = array.copy;
        
        
        NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
        
        NSWidthInsensitiveSearch|NSForcedOrderingSearch;
        
        NSComparator sort = ^(NSString *obj1,NSString *obj2){
            
            NSRange range = NSMakeRange(0,obj1.length);
            
            return [obj1 compare:obj2 options:comparisonOptions range:range];
            
        };
        
        //    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        //
        //        return (NSComparisonResult)NSOrderedAscending;
        //    };
        
        NSArray *keyArray = [array1 sortedArrayUsingComparator:sort];
        
        
        //key数组
        NSMutableArray *valueArray = [[NSMutableArray alloc] init];
        
        for (NSString *str in keyArray) {
            
            [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
                
                if ([str isEqualToString:key]) {
                    
                    [valueArray addObject:obj];
                }
                
                
            }];
            
        }
        
        
        
        for (NSInteger i = 0; i < keyArray.count; i++) {
            
            [str appendString:keyArray[i]];
            [str appendString:valueArray[i]];
            
        }
        
        NSLog(@"str - %@",str);
        
        return str;
   
}


@end
