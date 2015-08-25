//
//  ZZBSystemHelper.m
//  ZZB
//
//  Created by jwill on 15/5/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ZZBSystemHelper.h"

@implementation ZZBSystemHelper

SYNTHESIZE_SINGLETON_FOR_CLASS(ZZBSystemHelper)

-(void)versionChecker
{
    
}


+(BOOL)hasNewVersion
{
    NSNumber *ver =[[NSUserDefaults standardUserDefaults]objectForKey:kAppHasNewVersionKey];
    return ver.boolValue;
}


+(void)downloadNewVersion
{
    NSString *urlString =[[NSUserDefaults standardUserDefaults]objectForKey:kAppUpdateTestDownloadURlKey];
    if (!urlString)
        return;
    
    NSURL *url =[NSURL URLWithString:urlString];
    
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}


@end
