//
//  NSString+NSDate.m
//  FunnyStore
//
//  Created by HuiYang on 14-10-11.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "NSString+NSDate.h"

@implementation NSString (NSDate)

+(long long)longLongFromDate:(NSDate*)date
{
    return [date timeIntervalSince1970] * 1000;
}

+(NSDate*)dateDealUTCFromLongLong:(long long)msSince1970
{
      //处理UTC时间相差8小时问题
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:msSince1970 / 1000];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}

+(NSDate*)dateFromLongLong:(long long)msSince1970
{
  
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:msSince1970 / 1000];
    return date;
}

- (NSInteger)ageFromBirthday:(NSDate *)birthdate
{
    NSDate *today = [NSDate date];
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:birthdate
                                       toDate:today
                                       options:0];
    return ageComponents.year;
}

-(NSInteger)ageFromBirthdayString
{
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy-MM-dd";
    NSDate *dd =[df dateFromString:self];
    return [self ageFromBirthday:dd];
}

+(NSString*)sortTimeStamp:(long long)ts
{
    
    double times =(long long)ts/1000.0f;
    NSString *sort = [NSDateFormatter localizedStringFromDate:[NSDate dateWithTimeIntervalSince1970:times]
                                                    dateStyle:NSDateFormatterMediumStyle
                                                    timeStyle:NSDateFormatterShortStyle];
    return sort;
}

+(NSString*)formatYYYYMMDDformTimeStamp:(long long)ts
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    double times =(long long)ts/1000.0f;
    NSDate* curdate=[NSDate dateWithTimeIntervalSince1970:times];
    NSString *destDateString = [formatter stringFromDate:curdate];
    
    return destDateString;
}


+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+(NSDate*) convertDateFromTimeStamp:(long long)ts
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    double times =(long long)ts/1000.0f;
    NSDate* curdate=[NSDate dateWithTimeIntervalSince1970:times];
    return curdate;
}

+(long long) convertTimeStampFromDateStr:(NSString*)aStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSTimeZone *timeZone=[[NSTimeZone alloc] initWithName:@"GMT+0800"];
//    [formatter setTimeZone:timeZone];
    NSDate* date= [formatter dateFromString:aStr];
    return [date timeIntervalSince1970] * 1000;
}

+(NSString*) convertTimeFromTimeStamp:(long long)ts
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    double times =(long long)ts/1000.0f;
    NSDate* curdate=[NSDate dateWithTimeIntervalSince1970:times];
    NSString *destDateString = [formatter stringFromDate:curdate];
    
    return destDateString;

}

+(NSString*)reminderTimeFromTimeStamp:(long long)ts
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"HH:mm"];
    double times =(long long)ts/1000.0f;
    NSDate* curdate=[NSDate dateWithTimeIntervalSince1970:times];
    NSString *destDateString = [formatter stringFromDate:curdate];
    
    return destDateString;
    
}

@end
