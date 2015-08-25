//
//  UIApplication+LocalNotificationsUtils.m
//  ZZB
//
//  Created by HuiYang on 15/7/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIApplication+LocalNotificationsUtils.h"

@implementation UIApplication (LocalNotificationsUtils)

-(UILocalNotification*)localNotificationForKey:(NSString*)key
{
    NSArray *notifications = self.scheduledLocalNotifications;
    
    for (UILocalNotification *n in notifications)
    {
        if ([[n.userInfo valueForKey:@"key"] isEqualToString:key])
            return n;
    }
    
    return nil;
}

@end
