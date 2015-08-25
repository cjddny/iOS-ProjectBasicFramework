//
//  FamilyTaskManager.h
//  ZZB
//
//  Created by HuiYang on 15/7/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RemindsPublishModel;

@interface FamilyTaskManager : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(FamilyTaskManager);

-(void)start;
-(void)stop;

-(NSInteger)remindBadge;


//删除本地特定提醒
-(void)removeLocalNotificationWithSuperKeys:(NSString*)aKey;
//退出登录，清除本地全部提醒
-(void)removeLocalReminders;
//获取apns推送
-(void)getAPNSNotification:(NSDictionary*)userinfo;
//同步服务器提醒
-(void)syncReminds;
//前往家人界面
-(void)goFamily;
//前往发布活动界面
-(void)goPostActivity;
//前往活动主页
-(void)goActivity;
@end
