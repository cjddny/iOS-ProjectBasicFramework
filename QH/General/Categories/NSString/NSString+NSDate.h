//
//  NSString+NSDate.h
//  FunnyStore
//
//  Created by HuiYang on 14-10-11.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSDate)

-(NSInteger)ageFromBirthday:(NSDate *)birthdate;

-(NSInteger)ageFromBirthdayString;

+(NSString*)sortTimeStamp:(long long)ts;
+(NSString*)formatYYYYMMDDformTimeStamp:(long long)ts;
+(NSDate*) convertDateFromString:(NSString*)uiDate;
+(NSDate*) convertDateFromTimeStamp:(long long)ts;

+(NSString*) convertTimeFromTimeStamp:(long long)ts;

+(long long) convertTimeStampFromDateStr:(NSString*)aStr;

+(long long)longLongFromDate:(NSDate*)date;

+(NSDate*)dateFromLongLong:(long long)msSince1970;

+(NSString*)reminderTimeFromTimeStamp:(long long)ts;
+(NSDate*)dateDealUTCFromLongLong:(long long)msSince1970;
@end
