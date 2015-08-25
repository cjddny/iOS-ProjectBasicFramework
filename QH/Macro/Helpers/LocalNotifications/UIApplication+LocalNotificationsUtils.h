//
//  UIApplication+LocalNotificationsUtils.h
//  ZZB
//
//  Created by HuiYang on 15/7/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (LocalNotificationsUtils)

-(UILocalNotification*)localNotificationForKey:(NSString*)key;

@end
