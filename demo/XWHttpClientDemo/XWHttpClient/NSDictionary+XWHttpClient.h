//
//  NSDictionary+XWHttpClient.h
//  XWDataBaseManager
//
//  Created by wzl on 16/7/12.
//  Copyright © 2016年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XWHttpClient)

/**
 *  为字典对象添加基本网络请求参数
 */
- (NSDictionary*)xw_addBaseRequestParams;

/**
 *  将字典对象转换成get请求的参数格式
 */
- (NSString *)xw_getParamsUrlString;

/**
 *  获取基本网络请求参数
 */
+ (NSDictionary*)xw_getBaseRequestParams;

/**
 *  为字典对象添加基本网络请求参数
 *
 *  @param dic 需要操作的字典
 *
 *  @return 处理过的字典对象
 */
+ (NSDictionary*)xw_addBaseRequestParamsToDic:(NSDictionary*)dic;
@end
