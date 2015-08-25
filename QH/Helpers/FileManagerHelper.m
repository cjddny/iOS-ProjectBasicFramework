//
//  FileManagerHelper.m
//  ZZB
//
//  Created by HuiYang on 15/3/23.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "FileManagerHelper.h"

@implementation FileManagerHelper

+(NSString*)creatLocalUrlWithName:(NSString*)Name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString* voicePath = [NSString stringWithFormat:@"%@/VoiceCache",documentsDirectory];
    NSFileManager* file = [NSFileManager defaultManager];
    if (![file fileExistsAtPath:voicePath]) {
        [file createDirectoryAtPath:voicePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString*fileAllPath = [NSString stringWithFormat:@"%@/%@",voicePath,Name];
//    NSLog(@"缓存path===【%@】",fileAllPath);
    return fileAllPath;
}

@end
