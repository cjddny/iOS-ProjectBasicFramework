//
//  FamilyTaskManager.m
//  ZZB
//
//  Created by HuiYang on 15/7/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "FamilyTaskManager.h"
#import "APService.h"
#import "FamilyTaskView.h"
#import "TMCache.h"
#import "RemindsPublishModel.h"
#import "DCKeyValueObjectMapping.h"
#import "DCObjectMapping.h"
#import "DCParserConfiguration.h"
#import "AppDelegate.h"
#import "OrderManagerController.h"
#import "MyFamilyViewController.h"
#import "DiscoverViewController.h"
#import "MyPostActivityViewController.h"
#import "MyParticipateViewController.h"
#import "MyActivityViewController.h"
#import "ZZBServiceClient.h"
#import "NSDate+Utilities.h"
#import "DCKeyValueObjectMapping.h"
#import "DCObjectMapping.h"
#import "DCParserConfiguration.h"
#import "RemindersModel.h"
#import "JRNLocalNotificationCenter.h"
#import "NSString+NSDate.h"
#import "HomePageViewController.h"

#define kTag_RemindsForMySelf_IDS @"kTag_RemindsForMySelf_RE"
#define kTag_RemindsForOthers_IDS @"kTag_RemindsForOthers_RE"

#define kTag_SyncRemindsKey @"kTag_SyncRemindsKey--"



@interface FamilyTaskManager ()

//@property (nonatomic, strong)FamilyTaskView *noticeView;
@property (nonatomic, strong)NSMutableArray *dataSource;


@end

@implementation FamilyTaskManager
SYNTHESIZE_SINGLETON_FOR_CLASS(FamilyTaskManager)

-(void)start
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkDidReceiveMessage:)
                                                 name:kJPFNetworkDidReceiveMessageNotification
                                               object:nil];
    
    
}

-(void)stop
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


//极光推送 APPPP
- (void)networkDidReceiveMessage:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSString *title = [userInfo valueForKey:@"title"];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extra = [userInfo valueForKey:@"extras"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *currentContent = [NSString
                                stringWithFormat:
                                @"收到自定义消息:%@\ntitle:%@\ncontent:%@\nextra:%@\n",
                                [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                               dateStyle:NSDateFormatterNoStyle
                                                               timeStyle:NSDateFormatterMediumStyle],
                                title, content, [self logDic:extra]];
    NSLog(@"%@", currentContent);
    
    
//    KAlert(currentContent);
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic
{
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}

-(void)showNotice:(NSDictionary*)aDic
{
    FamilyTaskView *noticeView =[[FamilyTaskView alloc]init];
    [noticeView showRemindsViewWithDataDic:aDic];
}

-(void)syncReminds
{
    NSString *updateToken =nil;
    id obj =[[TMCache sharedCache]objectForKey:kTag_SyncRemindsKey];
    
    if (obj)
    {
        updateToken=obj[@"updateToken"];
    }
    
    WEAKSELF
    [[ZZBServiceClient getReminderWithType:@"other" WithToken:updateToken]subscribeNext:^(id x)
     {
         NSDictionary *tem =(NSDictionary*)x;
         
        if ([[tem objectForKey:@"succeeded"]boolValue])
         {
             NSArray *dataArr =x[@"data"][@"reminders"];
             
             if (dataArr.count==0)
             {
                 NSLog(@"不存在提醒，不需要处理-----");
                 return ;
             }
             
             
             DCParserConfiguration *config =[DCParserConfiguration configuration];
             config.datePattern = @"yyyy-MM-dd HH:mm:ss";
             DCObjectMapping *reminderMapper = [DCObjectMapping mapKeyPath:@"reminder" toAttribute:@"reminder" onClass:[RemindersModel class]];
             DCObjectMapping *relationshipMapper = [DCObjectMapping mapKeyPath:@"relationship" toAttribute:@"relationship" onClass:[RemindersModel class]];
             DCObjectMapping *userMapper = [DCObjectMapping mapKeyPath:@"userProfile" toAttribute:@"userProfile" onClass:[Relationshiper class]];
             
             [config addObjectMapping:reminderMapper];
             [config addObjectMapping:relationshipMapper];
             [config addObjectMapping:userMapper];
             
             DCKeyValueObjectMapping *parar =[DCKeyValueObjectMapping mapperForClass:[RemindersModel class] andConfiguration:config];
             
             [weakSelf.dataSource removeAllObjects];
             for (NSDictionary *dic in dataArr)
             {
                 RemindersModel *model =[parar parseDictionary:dic];
                 model.isMySelf=NO;
                 [weakSelf.dataSource addObject:model];
             }
         
            
             [weakSelf syncRemindSettingLocalNotification];
             [[TMCache sharedCache]setObject:x[@"data"] forKey:kTag_SyncRemindsKey];
             
         }else
         {
             NSLog(@"提醒不需要更新");
         }
     } error:^(NSError *error)
     {
         
     } completed:^{
         
     }];
}

-(void)syncRemindSettingLocalNotification
{
   
    for (RemindersModel *model in self.dataSource)
    {
        if([model.reminder.type isEqualToString:@"pill"])
        {
            NSString *reminderId =model.reminder.id;
            NSString *content =[NSString stringWithFormat:@"您有一条吃药提醒:%@",model.reminder.content];
            [self removeLocalNotificationWithSuperKeys:reminderId];
            for (NSNumber *aTime in model.reminder.timeOfDay)
            {
                long long time =[aTime longLongValue];
                NSDate *aDate =[NSString dateDealUTCFromLongLong:time];
                
                for (NSNumber *aWeek in model.reminder.dayOfWeek)
                {
                    NSInteger week =[aWeek integerValue];
                    NSLog(@"设置通知时间=[%@]星期=【%ld】",aDate,(long)week);
                    [self addLocalNotificationWithTime:aDate andWeek:week andTitle:content andKey:reminderId];
                }
                
            }
        }else
        {
            NSLog(@"其他类型");
        }
        
    }


}

-(void)addLocalNotificationWithTime:(NSDate*)aDate andWeek:(NSInteger)aWeek andTitle:(NSString*)aTitle andKey:(NSString*)aKey
{
        NSDateComponents * components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitHour | NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:aDate];
    
        NSInteger hour = components.hour;
        NSInteger minute = components.minute;
    
        NSDateComponents *comps = [[NSDateComponents alloc] init] ;
        NSInteger unitFlags = NSEraCalendarUnit |
        NSYearCalendarUnit |
        NSMonthCalendarUnit |
        NSDayCalendarUnit |
        NSHourCalendarUnit |
        NSMinuteCalendarUnit |
        NSSecondCalendarUnit |
        NSWeekCalendarUnit |
        NSWeekdayCalendarUnit |
        NSWeekdayOrdinalCalendarUnit |
        NSQuarterCalendarUnit;
    
        comps = [[NSCalendar currentCalendar] components:unitFlags fromDate:[NSDate date]];
        [comps setHour:hour];
        [comps setMinute:minute];
        [comps setSecond:0];
    
        NSInteger temp = 0;
        NSInteger days = 0;
    
        temp = aWeek - components.weekday;
        days = (temp >= 0 ? temp : temp + 7);
        NSDate *newFireDate = [[[NSCalendar currentCalendar] dateFromComponents:comps] dateByAddingTimeInterval:3600 * 24 * days];
    
    NSString* ppkey = [[NSUUID UUID] UUIDString];
    NSDictionary *userInfo =[NSDictionary dictionaryWithObjectsAndKeys:aKey,@"aKey", nil];
    [[JRNLocalNotificationCenter defaultCenter]postNotificationOn:newFireDate forKey:ppkey alertBody:aTitle alertAction:@"知道了" soundName:nil launchImage:nil userInfo:userInfo badgeCount:0 repeatInterval:NSCalendarUnitWeekday];
    
}

-(void)removeLocalNotificationWithKey:(NSString*)aKey
{
    [[JRNLocalNotificationCenter defaultCenter]cancelLocalNotificationForKey:aKey];
}

-(void)removeLocalNotificationWithSuperKeys:(NSString*)aKey
{
    NSArray *scheduleLocalPushNotifications =[[JRNLocalNotificationCenter defaultCenter]localNotifications];
    for (int i =0; i<scheduleLocalPushNotifications.count; i++)
    {
        UILocalNotification *localNotification=[scheduleLocalPushNotifications objectAtIndex:i];
        if ([localNotification.userInfo[@"aKey"] isEqualToString:aKey])
        {
            NSLog(@"找到存在的提醒---删除=【%@】",aKey);
            [[JRNLocalNotificationCenter defaultCenter]cancelLocalNotification:localNotification];
        }
        
    }
}

//退出登录，清除本地提醒
-(void)removeLocalReminders
{
    [[JRNLocalNotificationCenter defaultCenter]cancelAllLocalNotifications];
    [[TMCache sharedCache]removeObjectForKey:kTag_SyncRemindsKey];
    [self.dataSource removeAllObjects];
}

//去家人验证
-(void)goFamilyVerify
{    
    UINavigationController* discoverVC=(UINavigationController*)[self appDelegateWithIndex:2].tabbarController.selectedViewController;
    MyFamilyViewController *familyManager=[MyFamilyViewController new];
    [familyManager setHidesBottomBarWhenPushed:YES];
    [discoverVC pushViewController:familyManager animated:NO];

    [familyManager performSelector:@selector(familyValidateSel)];
}

//前往家人界面
-(void)goFamily
{
    UINavigationController* discoverVC=(UINavigationController*)[self appDelegateWithIndex:2].tabbarController.selectedViewController;
    MyFamilyViewController *familyManager=[MyFamilyViewController new];
    [familyManager setHidesBottomBarWhenPushed:YES];
    [discoverVC pushViewController:familyManager animated:NO];

}

//去订单界面
-(void)goOrderDetial
{
    OrderManagerController *orderManager=[OrderManagerController new];
    [orderManager setHidesBottomBarWhenPushed:YES];
    UINavigationController* setVC=(UINavigationController*)[self appDelegateWithIndex:3].tabbarController.selectedViewController;
    [setVC pushViewController:orderManager animated:NO];

}

//去我参与的活动
-(void)goMyPariticipateActivity
{
    MyActivityViewController *activityManager=[MyActivityViewController new];
    [activityManager setHidesBottomBarWhenPushed:YES];
    
    UINavigationController* setVC=(UINavigationController*)[self appDelegateWithIndex:3].tabbarController.selectedViewController;
    [setVC pushViewController:activityManager animated:NO];
    
    MyParticipateViewController *participateManager=[MyParticipateViewController new];
    [setVC pushViewController:participateManager animated:NO];
}

//去我发起的活动
-(void)goMyPostActivity
{
    MyActivityViewController *activityManager=[MyActivityViewController new];
    [activityManager setHidesBottomBarWhenPushed:YES];
    
    UINavigationController* setVC=(UINavigationController*)[self appDelegateWithIndex:3].tabbarController.selectedViewController;
    [setVC pushViewController:activityManager animated:NO];
    
    MyPostActivityViewController *postManager=[MyPostActivityViewController new];
    [setVC pushViewController:postManager animated:NO];
}

//前往发布活动界面
-(void)goPostActivity
{
    UINavigationController* setVC=(UINavigationController*)[self appDelegateWithIndex:0].tabbarController.selectedViewController;
    HomePageViewController* homeVC=[[setVC viewControllers] firstObject];
    [homeVC performSelector:@selector(addAction)];

}

//前往活动主页
-(void)goActivity
{
    [self appDelegateWithIndex:0];
}

//获取apns推送
-(void)getAPNSNotification:(NSDictionary*)userinfo
{
    //家人验证
    if ([userinfo[@"action_type"] isEqualToString:@"familyValidation"])
    {
        [self goFamilyVerify];
    }else if ([userinfo[@"action_type"] isEqualToString:@"weatherReminder_create"])
    {
        [self showNotice:userinfo];

    }else if ([userinfo[@"action_type"] isEqualToString:@"sleepReminder_create"])
    {
        [self showNotice:userinfo];
    }
    
}

-(NSMutableArray*)dataSource
{
    if (!_dataSource)
    {
        _dataSource=[[NSMutableArray alloc]init];
    }
    return _dataSource;
}

-(AppDelegate*)appDelegateWithIndex:(int)index
{
    AppDelegate *del =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    [del refleshUI];
    del.tabbarController.selectedIndex=index;
    return del;
}

@end
