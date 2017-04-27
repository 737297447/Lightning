//
//  APICloud.h
//  Inke
//
//  Created by longhy on 2017/4/6.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICloud : NSObject


//当为1时为线上环境,其他为线下环境
#define isOnline @"2"

#define ONLINE_URL @"https://api.shandaixia.com.cn:9191"
#define OFFLINE_URL @"http://116.62.26.225:8080"

#define CODE_SUCCESS @(1000000)


#define API_BASE_URL ([isOnline isEqualToString:@"1"]) ? ONLINE_URL:OFFLINE_URL


#define ONLINE_ACCESS_KEY @"699b9305418757ef9a26e5a32ca9dbfb"
#define OFFLINE_ACCESS_KEY @"699b9305418757ef9a26e5a32ca9dbfb"
#define accessKey ([isOnline isEqualToString:@"1"]) ? ONLINE_ACCESS_KEY:OFFLINE_ACCESS_KEY

#define ONLINE_SECRET_KEY @"0bca3e8e2baa42218040c5dbf6978f315e104e5c"
#define OFFLINE_SECRET_KEY @"0bca3e8e2baa42218040c5dbf6978f315e104e5c"
#define secretKey ([isOnline isEqualToString:@"1"]) ? ONLINE_SECRET_KEY:OFFLINE_SECRET_KEY


#define ONLINE_USERID @"6bd68333b2254b5888e2d9cd1cf71036"
#define OFFLINE_USERID @"e749a75a3b6e4898a1d6d420366680b5"

#define USERID ([isOnline isEqualToString:@"1"]) ? ONLINE_USERID:OFFLINE_USERID

#define PAGE_SIZE_MY @"10"





#define URL_MESSAGE @"/push/pushInfo"
#define URL_MESSAGE_DELETE @"/push/deleteStatus"
#define URL_MESSAGE_READ @"/push/updateStatus"





@end
