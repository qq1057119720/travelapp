//
//  NTESSessionMsgHelper.m
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESSessionMsgConverter.h"


@implementation NTESSessionMsgConverter



+ (NIMMessage*)msgWithFilePath:(NSString*)path{

    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithSourcePath:path];
    NSString *displayName     = path.lastPathComponent;
    fileObject.displayName    = displayName;
    NIMMessage *message       = [[NIMMessage alloc] init];
    message.messageObject     = fileObject;
    message.apnsContent = @"发来了一个文件";
    return message;
}

+ (NIMMessage*)msgWithFileData:(NSData*)data extension:(NSString*)extension{

    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithData:data extension:extension];
    NIMMessage *message       = [[NIMMessage alloc] init];
    message.messageObject     = fileObject;
    message.apnsContent = @"发来了一个文件";

    return message;
}


@end
