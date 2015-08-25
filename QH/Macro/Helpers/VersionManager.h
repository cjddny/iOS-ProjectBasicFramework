//
//  VersionManager.h
//  ZZB
//
//  Created by jwill on 15/5/19.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//


typedef NS_ENUM(NSInteger, AlertType)
{
    kAlertTypeNormal=1001,       //不处理
    kAlertTypeForce,             //强制
    kAlertTypeOptional,          //可选
    kAlertTypeChecking           //审核中
};


#import <Foundation/Foundation.h>

@interface VersionManager : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(VersionManager);
+(void)judgeNewVersion:(NSString*)aVersion;
+(UIAlertView*)deposeWithVersionData:(NSDictionary*)aDic;
@end
