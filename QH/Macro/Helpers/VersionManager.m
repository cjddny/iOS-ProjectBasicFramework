//
//  VersionManager.m
//  ZZB
//
//  Created by jwill on 15/5/19.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//



#import "VersionManager.h"

//static AlertType curAlertType = kAlertTypeNormal;


@implementation VersionManager
SYNTHESIZE_SINGLETON_FOR_CLASS(VersionManager)
+(void)judgeNewVersion:(NSString*)aVersion
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    if ([aVersion isEqualToString:version]) {
        NSLog(@"已经是最新版本");
    }else
    {
        KAlert(@"可更新");
    }
}

+(UIAlertView*)deposeWithVersionData:(NSDictionary*)aDic
{

    kChecking=NO;
    UIAlertView *alertView;
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    //读取本地版本
    NSString *localVersion=[[NSUserDefaults standardUserDefaults] objectForKey:kAppHasNewVersionKey];
    //更新本地版本
    if ([version floatValue]>[localVersion floatValue]) {
        [[NSUserDefaults standardUserDefaults] setObject:aDic[@"version"] forKey:kAppHasNewVersionKey];
    }
    
    if ([aDic[@"state"] isEqualToString:@"checking"]) {
        kChecking=YES;
        NSLog(@"审核中，先不处理");
        return nil;
    }
    if ([VersionManager CompareVerisonA:version withVersionB:aDic[@"version"]]) {
        NSLog(@"已经是最新版本");
        return nil;
    }else
    {
        if ([aDic[@"updateType"] isEqualToString:@"force"]) {
            alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:aDic[@"changeLog"] delegate:nil cancelButtonTitle:@"更新" otherButtonTitles:nil, nil];
            alertView.tag=kAlertTypeForce;
        }else
        {
            alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:aDic[@"changeLog"] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil];
            alertView.tag=kAlertTypeOptional;
        }
    }
    return alertView;
}

//比较版本
+(BOOL)CompareVerisonA:(NSString*)versionA withVersionB:(NSString*)versionB
{
    if ([versionA isEqualToString:versionB]) {
        return TRUE;
    }else
    {
        NSArray *compomentsA=[versionA componentsSeparatedByString:@"."];
        NSArray *compomentsB=[versionB componentsSeparatedByString:@"."];
        for (int i=0;i<[compomentsB count];i++) {
            if (i<[compomentsA count]) {
                if ([[compomentsA objectAtIndex:i] intValue]>[[compomentsB objectAtIndex:i] intValue]) {
                    NSLog(@"本地版本大");
                    return TRUE;
                }
            }else
            {
                return FALSE;
            }
        }
        return FALSE;
    }
}

@end

