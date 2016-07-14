//
//  XWHttpClient.h
//  XWDataBaseManager
//  http请求封装(AFNetworking 3.1.0)
//  tips：
//      这里没有和官方提供的demo一样去继承AFHTTPSessionManager 然后用单例模式获取对象！主要是出于以下考虑：
//          1、网络请求并发的情况，目前不清楚AFHTTPSessionManager是否支持同时多个请求（一个耗时请求还未完成另一个请求又被加入进来）还有待认证测试;
//  Created by wzl on 16/7/11.
//  Copyright © 2016年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MMProgressHUD.h"
#import "XWUploadModel.h"
#import "NSDictionary+XWHttpClient.h"

//主机地址
#define kHOST_ADDRESS @"http://www.huaqibang.com"

//定义返回请求数据的block类型
typedef void (^XWHttpClientSuccessBlock) (id returnValue);  //返回成功
typedef void (^XWHttpClientErrorBlock) (id errorCode);      //返回错误
typedef void (^XWHttpClientFailureBlock)(id failureInfo);   //请求失败

@interface XWHttpClient : NSObject

/**
 *  发送Http Get请求
 *
 *  @param urlString    请求的网址字符串
 *  @param params       请求参数(传nil)
 *  @param successBlock 请求成功返回
 *  @param errorBlock   请求错误返回
 *  @param failBlock    请求失败返回
 */
+ (void)xw_getWithUrlString:(NSString*)urlString
                     Params:(NSDictionary*)params
               SuccessBlock:(XWHttpClientSuccessBlock)successBlock
                 ErrorBlock:(XWHttpClientErrorBlock)errorBlock
               FailureBlock:(XWHttpClientFailureBlock)failBlock;

/**
 *  发送Http Post请求
 *
 *  @param urlString    请求的网址字符串
 *  @param params       请求参数
 *  @param successBlock 请求成功返回
 *  @param errorBlock   请求错误返回
 *  @param failBlock    请求失败返回
 */
+ (void)xw_postWithUrlString:(NSString*)urlString
                      Params:(NSDictionary*)params
                SuccessBlock:(XWHttpClientSuccessBlock)successBlock
                  ErrorBlock:(XWHttpClientErrorBlock)errorBlock
                FailureBlock:(XWHttpClientFailureBlock)failBlock;

/**
 *  上传一个或多个文件
 *
 *  @param urlString        请求的网址字符串
 *  @param params           请求参数
 *  @param uploadParams     XWUploadModel的对象数组
 *  @param uploadProgress   进度控制
 *  @param successBlock     请求成功返回
 *  @param errorBlock       请求错误返回
 *  @param failBlock        请求失败返回
 */
+ (void)xw_uploadFilesWithUrlString:(NSString*)urlString
                             Params:(NSDictionary*)params
                       UploadParams:(NSArray*)uploadParams
                           progress:(void (^)(NSProgress*))uploadProgress
                       SuccessBlock:(XWHttpClientSuccessBlock)successBlock
                         ErrorBlock:(XWHttpClientErrorBlock)errorBlock
                       FailureBlock:(XWHttpClientFailureBlock)failBlock;

@end
