//
//  XWHttpClient.m
//  XWDataBaseManager
//
//  Created by wzl on 16/7/11.
//  Copyright © 2016年 wzl. All rights reserved.
//

#import "XWHttpClient.h"

#define kXWHttpClientResponseSucess 1000 //请求成功

@implementation XWHttpClient

-(void)dealloc{
    NSLog(@"http Client is dealloc");
}

#pragma mark - get
+ (void)xw_getWithUrlString:(NSString *)urlString Params:(NSDictionary *)params SuccessBlock:(XWHttpClientSuccessBlock)successBlock ErrorBlock:(XWHttpClientErrorBlock)errorBlock FailureBlock:(XWHttpClientFailureBlock)failBlock{
    [MMProgressHUD show];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kHOST_ADDRESS]];
    manager.requestSerializer.timeoutInterval = 20.0f;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    //manager.operationQueue.maxConcurrentOperationCount = 5;
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MMProgressHUD dismiss];
        
        if ([responseObject[@"code"] integerValue]==kXWHttpClientResponseSucess) {
            if (successBlock) {
                successBlock(responseObject);
            }
        }
        else{
            if (errorBlock) {
                errorBlock(responseObject);
            }
        }
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MMProgressHUD dismiss];
        
        if (failBlock) {
            failBlock(error);
        }
    }];
}

#pragma mark - post
+ (void)xw_postWithUrlString:(NSString *)urlString Params:(NSDictionary *)params SuccessBlock:(XWHttpClientSuccessBlock)successBlock ErrorBlock:(XWHttpClientErrorBlock)errorBlock FailureBlock:(XWHttpClientFailureBlock)failBlock{
    
    [MMProgressHUD show];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kHOST_ADDRESS]];
    manager.requestSerializer.timeoutInterval = 20.0f;
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    
    [manager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MMProgressHUD dismiss];
        
        if ([responseObject[@"code"] integerValue]==kXWHttpClientResponseSucess) {
            if (successBlock) {
                successBlock(responseObject);
            }
        }
        else{
            if (errorBlock) {
                errorBlock(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MMProgressHUD dismiss];
        
        if (failBlock) {
            failBlock(error);
        }
    }];
}

#pragma mark - upload
+ (void)xw_uploadFilesWithUrlString:(NSString *)urlString Params:(NSDictionary *)params UploadParams:(NSArray *)uploadParams progress:(void (^)(NSProgress *))uploadProgress SuccessBlock:(XWHttpClientSuccessBlock)successBlock ErrorBlock:(XWHttpClientErrorBlock)errorBlock FailureBlock:(XWHttpClientFailureBlock)failBlock{
    [MMProgressHUD show];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kHOST_ADDRESS]];
    manager.requestSerializer.timeoutInterval = 60.0f;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (XWUploadModel*uploadModel in uploadParams) {
            [formData appendPartWithFileData:uploadModel.data name:uploadModel.name fileName:uploadModel.fileName mimeType:uploadModel.mimeType];
        }
  
        
    } progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MMProgressHUD dismiss];
        
        if ([responseObject[@"code"] integerValue]==kXWHttpClientResponseSucess) {
            if (successBlock) {
                successBlock(responseObject);
            }
        }
        else{
            if (errorBlock) {
                errorBlock(responseObject);
            }
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MMProgressHUD dismiss];
        
        if (failBlock) {
            failBlock(error);
        }
       
    }];
}


@end
