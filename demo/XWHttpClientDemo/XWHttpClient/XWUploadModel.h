//
//  XWUploadFileModel.h
//  XWDataBaseManager
//
//  Created by wzl on 16/7/12.
//  Copyright © 2016年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWUploadModel : NSObject
/**
 *  图片的二进制数据
 */
@property (nonatomic, strong) NSData *data;
/**
 *  服务器对应的解析字段名称
 */
@property (nonatomic, strong) NSString *name;
/**
 *  文件的名称(上传到服务器后，服务器保存的文件名)
 */
@property (nonatomic, strong) NSString *fileName;
/**
 *  文件的MIME类型(image/png,image/jpg等)
 */
@property (nonatomic, strong) NSString *mimeType;
@end
