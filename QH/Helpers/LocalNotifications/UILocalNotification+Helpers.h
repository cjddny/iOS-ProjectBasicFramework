//
//  UILocalNotification+Helpers.h
//  ZZB
//
//  Created by HuiYang on 15/7/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILocalNotification (Helpers)

-(void)recheduleFireTime:(NSDate*)fireTime;
-(void)recheduleRepeat:(NSCalendarUnit)calendarUnit;

+(UILocalNotification*)createLocalNotification:(NSDate*)fireDate
                                     alertBody:(NSString*)alertBody
                                   alertAction:(NSString*)alertAction
                                      userInfo:(NSDictionary*)userInfo;

@end
