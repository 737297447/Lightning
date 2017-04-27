//
//  HttpTool.m
//  05-二次封装AFN
//
//  Created by 大欢 on 16/8/4.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "HttpTool.h"


@interface AFHttpClient : AFHTTPSessionManager


+ (instancetype)sharedClient:(NSDictionary *)params withUrl:(NSString *)url;


@end

@implementation AFHttpClient



+ (instancetype)sharedClient:(NSDictionary *)params withUrl:(NSString *)url {
    
    static AFHttpClient * client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL] sessionConfiguration:configuration];
        //接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        //设置超时时间
        client.requestSerializer.timeoutInterval = 15;
        //安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
    });
    
    
    NSString *sortString = [params sort:params];
    NSString *reqTime = [FDDateFormatter getCurrentTime];
    NSString *sign = [NSString stringWithFormat:@"%@%@%@",secretKey,reqTime,sortString];
    
    NSString* singMd5 = [[sign md5] md5];
    
    [client.requestSerializer setValue:reqTime forHTTPHeaderField:@"reqTime"];
    [client.requestSerializer setValue:singMd5 forHTTPHeaderField:@"sign"];
    [client.requestSerializer setValue:accessKey forHTTPHeaderField:@"accessKey"];
    
    
    NSString* myParams = [[NSString alloc]init];
    NSArray *arrKey = [params allKeys];
    NSArray *arrValue = [params allValues];
    for (NSInteger i = 0; i < arrKey.count; i++) {
        NSString* newStr;
        if (i != arrKey.count-1) {
            newStr = [NSString stringWithFormat:@"%@=%@&",arrKey[i],arrValue[i]];
        }else{
            newStr = [NSString stringWithFormat:@"%@=%@",arrKey[i],arrValue[i]];
        }
        
        myParams  = [myParams stringByAppendingString:newStr];
    }
    
    NSLog(@"当前的请求连接为:%@?%@",url,myParams);

    
    
    
    return client;
}

@end

@implementation HttpTool

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    //获取完整的url路径
    NSString * url = [API_BASE_URL stringByAppendingPathComponent:path];
    
    AFHttpClient* client =[AFHttpClient sharedClient:params withUrl:url];
    
    [client GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];

}



+ (void)postWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    //获取完整的url路径
    NSString * url = [API_BASE_URL stringByAppendingPathComponent:path];
    
    
    AFHttpClient* client =[AFHttpClient sharedClient:params withUrl:url];
    
    [client POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                 failure:(HttpFailureBlock)failure
                progress:(HttpDownloadProgressBlock)progress {
    
    //获取完整的url路径
    NSString * urlString = [API_BASE_URL stringByAppendingPathComponent:path];
    
    //下载
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    
    NSURLSessionDownloadTask *downloadTask = [[AFHttpClient sharedClient:nil withUrl:nil] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress.fractionCompleted);
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        //获取沙盒cache路径
        NSURL * documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            failure(error);
        } else {
            success(filePath.path);
        }
        
    }];
    
    [downloadTask resume];
    
}

+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imagekey
                      image:(UIImage *)image
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   progress:(HttpUploadProgressBlock)progress {
    
    //获取完整的url路径
    NSString * urlString = [API_BASE_URL stringByAppendingPathComponent:path];
    
    NSData * data = UIImagePNGRepresentation(image);
    
    [[AFHttpClient sharedClient:nil withUrl:nil] POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:imagekey fileName:@"01.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


@end
