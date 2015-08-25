 //
//  AccountManager.m
//  ZZB
//
//  Created by jwill on 15/2/5.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "AccountManager.h"

#import "DCKeyValueObjectMapping.h"
#import "DCArrayMapping.h"
#import "DCParserConfiguration.h"
#import "NSObject+ObjectMap.h"

#import "TMCache.h"


static BOOL isLogin = NO;
static BOOL reFreshMe = YES;
static BOOL showPanda = YES;


static NSString *uploadToken=@"";
static NSString *tempUploadToken=@"";

static NSString *userToken =@"";
static NSString *tempAccessToken =@"";

static NSString *filterV =@"";
static NSString *Uid=@"";

//static MemberInfo *localMemberInfo=nil;


@implementation AccountManager

+(instancetype)sharedInstance{
    static id sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
//
//+(BOOL)isRefresh
//{
//    return reFreshMe;
//}
//
//+(void)SetRefresh:(BOOL)state
//{
//    reFreshMe=state;
//}
//
//+(NSString*)getUid
//{
//    if (Uid.length>1)
//    {
//        return Uid;
//    }else
//    {
//        Uid=[self getMemberInfoInLocal].userProfile.id;
//        return Uid;
//    }
//}
//
//+ (BOOL)isLogin
//{
//    BOOL loginStatus=NO;
//    
//    if (!isLogin)
//    {
//        if ([self getMemberInfoInLocal].token)
//        {
//            if ([self getMemberInfoInLocal].token.length>2)
//            {
//                loginStatus=YES;
//            }
//        }
//    }else
//    {
//        loginStatus=isLogin;
//    }
//    
//    return loginStatus;
//}
//
//+ (void)setLogin:(BOOL)state WithObject:(NSDictionary *)dataDic
//{
//    isLogin = state;
//    //
//    if (!state)
//    {
//        userToken =@"";
//        uploadToken =@"";
//        localMemberInfo=nil;
//        Uid=@"";
//        [[NSUserDefaults standardUserDefaults]removeObjectForKey: kMemberInfoInLocalKey];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        [AccountManager clearWeiXinLocalInfo];
//        [self setPushAlias:@""];
//        [self loginIMServer:NO];
//        [[FamilyTaskManager sharedInstance]removeLocalReminders];
//    }else
//    {
//        if (dataDic)
//        {
//            [self setMemberInfoInLocalWithObject:dataDic];
//        }
//        
//        userToken =[self getMemberInfoInLocal].token;
//        uploadToken =[self getMemberInfoInLocal].uploadToken;
//        Uid=[self getMemberInfoInLocal].userProfile.id;
//        [self setPushAlias:[self getMemberInfoInLocal].userProfile.id];
//        [self loginIMServer:YES];
//        [[FamilyTaskManager sharedInstance]syncReminds];
//    }
//    
//    //清楚tempAccesstoken
//    [AccountManager setTempAccessToken:nil];
//}
//
//+(void)loginIMServer:(BOOL)isNeed
//{
//    BOOL isLoginNow=[[EaseMob sharedInstance].chatManager isLoggedIn];
//    if(isLoginNow && isNeed)
//    {
//        return;
//    }
////    BOOL postLoginOrLoginOut=NO;
////    
////    if (isNeed && !isLoginNow)
////    {
////        postLoginOrLoginOut=YES;
////        
////    }else if (!isNeed && isLoginNow)
////    {
////        postLoginOrLoginOut=NO;
////    }
//    
//    [[NSNotificationCenter defaultCenter]postNotificationName:kRefreshLoginStatus object:nil userInfo:@{ @"loginStatus": [NSNumber numberWithBool:isNeed] }];
//    
//}
//
//#pragma mark -- userToken
//+(NSString*)getUserToken
//{
//    if (userToken.length>1)
//    {
//        NSLog(@"登录token =【%@】",userToken);
//        return userToken;
//    }else
//    {
//        return [self getMemberInfoInLocal].token;
//    }
//}
//
//+(NSString*)getUserUploadToken
//{
//    if (uploadToken.length>1)
//    {
//        return uploadToken;
//    }else
//    {
//        return [self getMemberInfoInLocal].uploadToken;
//    }
//}
//
//#pragma mark -- MemberInfo
///**
// *  set current login member info
// *
// *  @param dataDic : member info data in Dictionary
// */
//+(void)setMemberInfoInLocalWithObject:(NSDictionary *)dataDic
//{
//    localMemberInfo=nil;
//    [[NSUserDefaults standardUserDefaults]setObject:[self checkNull:dataDic] forKey:kMemberInfoInLocalKey];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//}
//
//+(void)setMemberInfoInLocalWithMemberObject:(MemberInfo *)aMem
//{
//    DCObjectMapping *memberMapper = [DCObjectMapping mapKeyPath:@"member" toAttribute:@"member" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *tokenMapper = [DCObjectMapping mapKeyPath:@"token" toAttribute:@"token" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *uploadTokenMapper = [DCObjectMapping mapKeyPath:@"uploadToken" toAttribute:@"uploadToken" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *roleMapper = [DCObjectMapping mapKeyPath:@"role" toAttribute:@"role" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *impdMapper = [DCObjectMapping mapKeyPath:@"impw" toAttribute:@"impw" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *mobileMapper = [DCObjectMapping mapKeyPath:@"mobile" toAttribute:@"mobile" onClass:[MemberInfo class]];
//    
//    DCParserConfiguration *config =[DCParserConfiguration configuration];
//    [config addObjectMapping:memberMapper];
//    [config addObjectMapping:tokenMapper];
//    [config addObjectMapping:uploadTokenMapper];
//    [config addObjectMapping:roleMapper];
//    [config addObjectMapping:impdMapper];
//    [config addObjectMapping:mobileMapper];
//
//    
//    DCKeyValueObjectMapping *parser =[DCKeyValueObjectMapping mapperForClass:[MemberInfo class] andConfiguration:config];
//    
//    NSDictionary *tempDic = [parser serializeObject:aMem];
//    
//    
//    DCParserConfiguration *configUser =[DCParserConfiguration configuration];
//    DCObjectMapping *idMapper = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"id" onClass:[UserProfileModel class]];
//    DCObjectMapping *genderMapper = [DCObjectMapping mapKeyPath:@"gender" toAttribute:@"gender" onClass:[UserProfileModel class]];
//    DCObjectMapping *displayNameMapper = [DCObjectMapping mapKeyPath:@"displayName" toAttribute:@"displayName" onClass:[UserProfileModel class]];
//    DCObjectMapping *avatarMapper = [DCObjectMapping mapKeyPath:@"avatar" toAttribute:@"avatar" onClass:[UserProfileModel class]];
//    DCObjectMapping *emailMapper = [DCObjectMapping mapKeyPath:@"email" toAttribute:@"email" onClass:[UserProfileModel class]];
//    DCObjectMapping *birthMapper = [DCObjectMapping mapKeyPath:@"birth" toAttribute:@"birth" onClass:[UserProfileModel class]];
//   
//    
//    [configUser addObjectMapping:idMapper];
//    [configUser addObjectMapping:genderMapper];
//    [configUser addObjectMapping:displayNameMapper];
//    [configUser addObjectMapping:avatarMapper];
//    [configUser addObjectMapping:emailMapper];
//    [configUser addObjectMapping:birthMapper];
//    DCKeyValueObjectMapping *userParser =[DCKeyValueObjectMapping mapperForClass:[UserProfileModel class] andConfiguration:configUser];
//    
//    NSDictionary *userDic = [userParser serializeObject:aMem.userProfile];
//    
//    DCParserConfiguration *configVip =[DCParserConfiguration configuration];
//    DCObjectMapping *gradeMapper = [DCObjectMapping mapKeyPath:@"grade" toAttribute:@"grade" onClass:[VipModel class]];
//    DCObjectMapping *vipGradeTypeMapper = [DCObjectMapping mapKeyPath:@"vipGradeType" toAttribute:@"vipGradeType" onClass:[VipModel class]];
//    DCObjectMapping *statusMapper = [DCObjectMapping mapKeyPath:@"status" toAttribute:@"status" onClass:[VipModel class]];
//    DCObjectMapping *vipStatusMapper = [DCObjectMapping mapKeyPath:@"vipStatus" toAttribute:@"vipStatus" onClass:[VipModel class]];
//    DCObjectMapping *createdAtMapper = [DCObjectMapping mapKeyPath:@"createdAt" toAttribute:@"createdAt" onClass:[VipModel class]];
//    DCObjectMapping *updatedAtAtMapper = [DCObjectMapping mapKeyPath:@"updatedAt" toAttribute:@"updatedAt" onClass:[VipModel class]];
//    [configVip addObjectMapping:gradeMapper];
//    [configVip addObjectMapping:vipGradeTypeMapper];
//    [configVip addObjectMapping:statusMapper];
//    [configVip addObjectMapping:vipStatusMapper];
//    [configVip addObjectMapping:createdAtMapper];
//    [configVip addObjectMapping:updatedAtAtMapper];
//    DCKeyValueObjectMapping *vipParser =[DCKeyValueObjectMapping mapperForClass:[VipModel class] andConfiguration:configVip];
//    
//    NSDictionary *vipDic = [vipParser serializeObject:aMem.vip];
//    
//    NSMutableDictionary *memberDic=[[NSMutableDictionary alloc]initWithDictionary:tempDic];
//    
//    
//    
//    
//    DCParserConfiguration *configWeixin =[DCParserConfiguration configuration];
//     DCObjectMapping *openidMapper = [DCObjectMapping mapKeyPath:@"openid" toAttribute:@"openid" onClass:[WeixinModel class]];
//    DCObjectMapping *isBindedMapper = [DCObjectMapping mapKeyPath:@"isBinded" toAttribute:@"isBinded" onClass:[WeixinModel class]];
//    
//    [config addObjectMapping:openidMapper];
//    [config addObjectMapping:isBindedMapper];
//
//    
//    DCKeyValueObjectMapping *weixinParser =[DCKeyValueObjectMapping mapperForClass:[WeixinModel class] andConfiguration:configWeixin];
//    NSDictionary *weixinDic = [weixinParser serializeObject:aMem.weixin];
//
//    
//    
//    [memberDic setValue:userDic forKey:@"userProfile"];
//    [memberDic setValue:vipDic forKey:@"vip"];
//    [memberDic setValue:weixinDic forKey:@"weixin"];
//
//    
//    [AccountManager setMemberInfoInLocalWithObject:memberDic];
//}
//
///**
// *  get the current login member info
// *
// *  @return the current login member(Dictionary)
// */
//+(NSDictionary*)getMemberInfoInLocalWithDic
//{
//    NSData *dataDic =[[NSUserDefaults standardUserDefaults]objectForKey:kMemberInfoInLocalKey];
//    NSDictionary* serverModules;
//    
//    if (dataDic)
//    {
//        serverModules = [NSKeyedUnarchiver unarchiveObjectWithData:dataDic];
//    }else
//    {
//        serverModules = [NSDictionary dictionary];
//    }
//    
//    return serverModules;
//}
//
//
///**
// *  get the current login member info
// *
// *  @return the current login member(MemberInfo)
// */
//+(MemberInfo*)getMemberInfoInLocal
//{
//    if (localMemberInfo)
//    {
//        return localMemberInfo;
//    }
//    
//    DCObjectMapping *userProfilemapper = [DCObjectMapping mapKeyPath:@"userProfile" toAttribute:@"userProfile" onClass:[MemberInfo class]];
//    
//    DCObjectMapping *vipModelmapper = [DCObjectMapping mapKeyPath:@"vip" toAttribute:@"vip" onClass:[MemberInfo class]];
//    
//    DCParserConfiguration *config =[DCParserConfiguration configuration];
//    [config addObjectMapping:userProfilemapper];
//    [config addObjectMapping:vipModelmapper];
//    
//    DCKeyValueObjectMapping *parser =[DCKeyValueObjectMapping mapperForClass:[MemberInfo class] andConfiguration:config];
//    
//    MemberInfo *info = [parser parseDictionary:[self getMemberInfoInLocalWithDic] ];
//    
//    userToken=info.token;
//    uploadToken=info.uploadToken;
//   
//    
//    return info;
//}
//
///**
// *  if the source dictionary contains nil object convert it to ""
// *
// *  @param dic : the input dictionary
// *
// *  @return a dictionary do not contains nil object
// */
//
//+(NSData*)checkNull:(NSDictionary*)dic
//{
//    NSData* archivedServerModules = [NSKeyedArchiver archivedDataWithRootObject:dic];
//    return archivedServerModules;
//}
//
//+(NSData*)checkNullArr:(NSMutableArray*)arr
//{
//    NSData* archivedServerModules = [NSKeyedArchiver archivedDataWithRootObject:arr];
//    return archivedServerModules;
//}
//
//+(void)setTempUploadToken:(NSString *)tempToken
//{
//    tempUploadToken =tempToken;
//}
//
//+(NSString*)getTempUploadToken
//{
//    return tempUploadToken;
//}
//
//+(void)setTempAccessToken:(NSString *)aAccessToken
//{
//    tempAccessToken=aAccessToken;
//}
//+(NSString*)getTempAccessToken
//{
//    return tempAccessToken;
//}
//
////设置微信绑定信息
//+(void)setWeiXinLocalInfo:(NSDictionary*)aDic
//{
//    [[NSUserDefaults standardUserDefaults]setObject:[self checkNull:aDic] forKey:kWeiXinInfoInLocalKey];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//}
//
////读取微信绑定信息
//+(NSDictionary*)getWeiXinLocalInfo
//{
//    NSData *dataDic =[[NSUserDefaults standardUserDefaults]objectForKey:kWeiXinInfoInLocalKey];
//    NSDictionary* serverModules;
//    
//    if (dataDic)
//    {
//        serverModules = [NSKeyedUnarchiver unarchiveObjectWithData:dataDic];
//    }else
//    {
//        serverModules = [NSDictionary dictionary];
//    }
//    return serverModules;
//}
//
////清空本地微信信息
//+(void)clearWeiXinLocalInfo
//{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kWeiXinInfoInLocalKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
////设置本地收货人信息
//+(void)setReceiverLocalInfo:(NSMutableArray*)aArr
//{
//    [[NSUserDefaults standardUserDefaults]setObject:[self checkNullArr:aArr] forKey:kReceiverInfoInLocalKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
////读取本地收货人信息
//+(NSMutableArray*)getReceiverInfo
//{
//    NSData *dataDic =[[NSUserDefaults standardUserDefaults]objectForKey:kReceiverInfoInLocalKey];
//    NSMutableArray* serverModules;
//    
//    if (dataDic)
//    {
//        serverModules = [NSKeyedUnarchiver unarchiveObjectWithData:dataDic];
//    }else
//    {
//        serverModules = [NSMutableArray array];
//    }
//    return serverModules;
//}
//
////清空本地收货人信息
//+(void)clearReceiverInfo
//{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kReceiverInfoInLocalKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
////本地存储默认收货人序号
//+(void)setLocalAddressSelectIndex:(int)aIndex
//{
//    //加入纠错机制
//    if ([[AccountManager getReceiverInfo] count]<aIndex) {
//        return;
//    }
//    
//    NSNumber *objInt=[NSNumber numberWithInt:aIndex];
//    [[NSUserDefaults standardUserDefaults]setObject:objInt forKey:kReceiverIndexInLocalKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
////读取本地收货人序号
//+(int)getReceiverIndex
//{
//    NSNumber *dataNum =[[NSUserDefaults standardUserDefaults]objectForKey:kReceiverIndexInLocalKey];
//    return [dataNum intValue];
//}
//
////清空本地收货人序号
//+(void)clearReceiverIndex
//{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kReceiverIndexInLocalKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
////筛选版本号
//+(NSString*)getFilterVersion
//{
//    if ([filterV isEqualToString:@""])
//    {
//        id cacheObj =[[TMCache sharedCache]objectForKey:kTMCacheColumnsIDKey];
//        NSNumber *version =cacheObj[@"version"];
//        [self setFilterVersion:[version stringValue]];
//        return filterV;
//    }else
//    {
//        return filterV;
//    }
//}
//
//+(void)setFilterVersion:(NSString *)v
//{
//    filterV=v;
//}
//
//+(void)setPushAlias:(NSString*)name
//{
//    [APService setAlias:name
//       callbackSelector:@selector(tagsAliasCallback:tags:alias:)
//                 object:self];
//}
//
//+(void)tagsAliasCallback:(int)iResCode
//                     tags:(NSSet *)tags
//                    alias:(NSString *)alias
//{
//    NSString *callbackString =[NSString stringWithFormat:@"%d, \ntags: %@, \nalias: %@\n", iResCode,[self logSet:tags], alias];
//
//    NSLog(@"设置推送别名TagsAlias回调:%@", callbackString);
//}
//
//// log NSSet with UTF8
//// if not ,log will be \Uxxx
//+(NSString *)logSet:(NSSet *)dic {
//    if (![dic count]) {
//        return nil;
//    }
//    NSString *tempStr1 =
//    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
//                                                 withString:@"\\U"];
//    NSString *tempStr2 =
//    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
//    NSString *tempStr3 =
//    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
//    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *str =
//    [NSPropertyListSerialization propertyListFromData:tempData
//                                     mutabilityOption:NSPropertyListImmutable
//                                               format:NULL
//                                     errorDescription:NULL];
//    return str;
//}

@end
