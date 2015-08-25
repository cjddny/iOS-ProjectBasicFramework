//
//  ZZBSystemHelper.h
//  ZZB
//
//  Created by jwill on 15/5/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZBSystemHelper : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(ZZBSystemHelper);

-(void)versionChecker;     //版本检测方法
+(BOOL)hasNewVersion;      //是否有新版本
+(void)downloadNewVersion; //下载新版本



@end
