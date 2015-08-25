//
//  AccountManager.h
//  ZZB
//
//  Created by jwill on 15/2/5.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberInfo.h"

@interface AccountManager : NSObject



+(instancetype)sharedInstance;
//UserProfileModel ID
+ (NSString*)getUid;

+ (NSString*)getUserUploadToken;
+ (NSString*)getUserToken;
+ (NSString*)getFilterVersion;
+ (void)setFilterVersion:(NSString*)v;

+ (BOOL)isLogin;
+ (void)setLogin:(BOOL)state WithObject:(NSDictionary *)dataDic;

+(VipGradeType)getMemberType;
+(VipStatus)getMemberStatus;

+(MemberInfo*)getMemberInfoInLocal;

+(void)setTempUploadToken:(NSString*)tempToken;
+(NSString*)getTempUploadToken;

+(BOOL)isRefresh;
+(void)SetRefresh:(BOOL)state;
+(BOOL)isShowPanda;
+(void)setShowPanda:(BOOL)state;
+(void)setMemberInfoInLocalWithMemberObject:(MemberInfo *)aMem;
+(void)setMemberInfoInLocalWithObject:(NSDictionary *)dataDic;
+(NSDictionary*)getMemberInfoInLocalWithDic;

//设置微信绑定信息
+(void)setWeiXinLocalInfo:(NSDictionary*)aDic;
+(NSDictionary*)getWeiXinLocalInfo;
+(void)clearWeiXinLocalInfo;

//设置本地收货人信息
+(void)setReceiverLocalInfo:(NSMutableArray*)aArr;
+(NSMutableArray*)getReceiverInfo;
+(void)clearReceiverInfo;


//本地存储默认收货人序号
+(void)setLocalAddressSelectIndex:(int)aIndex;
+(int)getReceiverIndex;
+(void)clearReceiverIndex;


+(void)setTempAccessToken:(NSString *)tempAccessToken;
+(NSString*)getTempAccessToken;
@end
