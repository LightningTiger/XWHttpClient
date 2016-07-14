//
//  NSDictionary+XWHttpClient.m
//  XWDataBaseManager
//
//  Created by wzl on 16/7/12.
//  Copyright © 2016年 wzl. All rights reserved.
//

#import "NSDictionary+XWHttpClient.h"

@implementation NSDictionary (XWHttpClient)

- (NSDictionary *)xw_addBaseRequestParams{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params addEntriesFromDictionary:self];
    [params addEntriesFromDictionary:[NSDictionary xw_getBaseRequestParams]];
    
    return [params copy];
}

- (NSString *)xw_getParamsUrlString{
    NSMutableString *urlString=[NSMutableString stringWithFormat:@""];
    NSInteger i = 0;
    for (NSString*key in self.allKeys) {
        if (i!=0) {
            [urlString appendFormat:@"&"];
        }
        
        id value = [self objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [urlString appendFormat:@"%@='%@'",key,value ];
        }
        else{
            [urlString appendFormat:@"%@=%@",key,value];
        }
        
        i++;
    }
    
    return urlString;
}

+ (NSDictionary *)xw_addBaseRequestParamsToDic:(NSDictionary *)dic{
    
    return [dic xw_addBaseRequestParams];
}

+ (NSDictionary *)xw_getBaseRequestParams{
    NSString*uuid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uuid"];
    NSString*ticket = [[NSUserDefaults standardUserDefaults] objectForKey:@"ticket"];
    
    if (uuid.length >0 ) {
        return  @{@"uuid":uuid,@"ticket":ticket};
    }
    else{
        return  @{@"uuid":@"",@"ticket":@""};
    }
}
@end
