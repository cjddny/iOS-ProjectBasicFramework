//
//  NSString+AvatarString.m
//  FunnyStore
//
//  Created by jwill on 14-10-18.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "NSString+AvatarString.h"

@implementation NSString (IdCheck)


-(BOOL)isIdCard{
    if ([self length] != 15 && [self length] != 18) {
        return FALSE;
    }
    if ([self length] == 15) {
        if (![self isPureInt:self]) {
            return FALSE;
        }
        //规则校验
        int iCheck[15];
        NSString *num;
        for(int i=0; i<15;i++)
        {
            num = [self substringWithRange:NSMakeRange(i, 1)];
            iCheck[i] = [num intValue];
        }
        int iMonth = iCheck[8]*10 + iCheck[9];
        if (iMonth <= 0 || iMonth >12) {
            return FALSE;
        }
        int iDay = iCheck[10]*10 + iCheck[11];
        if (iDay <= 0 || iDay > 31) {
            return FALSE;
        }
        //end 校验规则
    }
    if ([self length] == 18) {
        NSString *checkNum = [self substringWithRange:NSMakeRange(0, 17)];
        NSString *check = [self substringWithRange:NSMakeRange(17, 1)];
        if (![self isPureInt:checkNum]){
            return FALSE;
        }
        if (![self isPureInt:check] && ![check isEqualToString:@"X"] && ![check isEqualToString:@"x"])
        {
            return FALSE;
        }
        //规则校验
        int iCheck[18];
        NSString *num;
        for(int i=0; i<17;i++)
        {
            num = [self substringWithRange:NSMakeRange(i, 1)];
            iCheck[i] = [num intValue];
        }
        int iYear = iCheck[6]*10 + iCheck[7];
        if (iYear < 19 || iYear >20)
        {
            return FALSE;
        }
        int iMonth = iCheck[10]*10 + iCheck[11];
        if (iMonth <= 0 || iMonth >12) {
            return FALSE;
        }
        int iDay = iCheck[12]*10 + iCheck[13];
        if (iDay <= 0 || iDay > 31) {
            return FALSE;
        }
        int sum=0;
        int wi[] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
        char list[11] = {'1', '0', 'X', '9', '8','7', '6' ,'5', '4', '3', '2'};
        for (int i = 0; i < 17; i++)
        {
            sum += iCheck[i]* wi[i];
        }
        int iCheckNum = sum % 11;
        char checkCode = list[iCheckNum];
        if ([check isEqualToString:@"x"] || [check isEqualToString:@"X"])
        {
            if (checkCode != 'X') {
                return FALSE;
            }
        }
        else
        {
            if ([check intValue] != (checkCode-'0'))
            {
                return FALSE;
            }
        }
        //end 校验规则
    }
    //规则校验
    return YES;
}

-(BOOL)isName{
    if ([self length]<2 || [self length]>55) {
        return FALSE;
    }
    //规则校验
    char szName[100];
    strcpy(szName, [self UTF8String]);
    BOOL isCn = YES;
    int iLength = strlen(szName);
    //判断是否纯中文
    for (int i = 0; i < iLength; i++)
    {
        if (szName[i] > 0)
        {
            isCn = FALSE;
        }
        
    }
    //纯中文长度不超过9
    if (isCn)
    {
        if ([self length] > 9)
        {
            return FALSE;
        }
        else
        {
            return YES;
        }
    }
    //判断是否有不合格字符
    for (int i = 0; i < iLength; i++) {
        if (!('/' == szName[i] || ' ' == szName[i] || (szName[i] <= 'z' && szName[i] >= 'a') || (szName[i] <= 'Z' && szName[i] >= 'A') || szName[i]<0))
        {
            return FALSE;
        }
    }
    
    for (int i=0; i< iLength-1; i++) {
        if (szName[i] == ' ' && szName[i+1] == ' ') {
            return FALSE;
        }
    }
    if (szName[0] == ' ' || szName[iLength-1] == ' ') {
        return FALSE;
    }
    
    BOOL isEng = YES; //是否英文名
    for (int i=0; i<iLength; i++) {
        if (!(isLetter(szName[i]) || szName[i] == '/' || szName[i] == ' ')) {
            isEng = FALSE;
        }
    }
    if (isEng) {
        BOOL isHave = FALSE;
        int iInvCount = 0;
        for (int i=0; i<iLength;i++)
        {
            if (szName[i] == '/') {
                isHave = YES;
                iInvCount++;
                if (i<2 || i>=iLength-2) {
                    return FALSE;
                }
                if (szName[i-1] == ' ' || szName[i+1] == ' ') {
                    return NO;
                }
                if (szName[i-2] == ' ')
                {
                    return NO;
                }
            }
            
        }
        if (!isHave) {
            return FALSE;
        }
        if (iInvCount>1) {
            return NO;
        }
        int iSpaceCount = 0;
        for (int i=0; i<iLength; i++) {
            if (szName[i] == ' ') {
                iSpaceCount++;
                if (!(isLetter(szName[i-1]) && isLetter(szName[i+1]))) {
                    return NO;
                }
            }
        }
        if (iSpaceCount > 1)
        {
            return NO;
        }
        return YES;
    }
    //中英文混合校验
    BOOL isCnEn = YES;
    if (szName[0]>=0 || !isLetter(szName[iLength-1])) {
        isCnEn = NO;
        return NO;
    }
    for (int i = 0; i < iLength; i++) {
        if (!(' ' == szName[i] || (szName[i] <= 'z' && szName[i] >= 'a') || (szName[i] <= 'Z' && szName[i] >= 'A') || szName[i]<0))
        {
            return FALSE;
        }
    }
    int iChange = 0;
    int iBeginEn = 0;
    for( int i=0; i<iLength-1; i++) {
        if (szName[i]*szName[i+1]<0) {
            iChange++;
            if (iChange>1) {
                return NO;
            }
            if (i>iLength-3) {
                return NO;
            }
            iBeginEn = i+1;
        }
    }
    int iCnCount = 0;
    for (int i=0; i<iLength; i++) {
        if (szName[i] < 0) {
            iCnCount++;
        }
        if (iCnCount>27) {
            return NO;
        }
    }
    int iSpaceCount = 0;
    for (int i=iBeginEn; i<iLength; i++) {
        if (szName[i] == ' ') {
            iSpaceCount++;
        }
    }
    if (iSpaceCount>1) {
        return NO;
    }
    if (iLength<4) {
        return NO;
    }
    
    //end规则校验
    return YES;
}

-(BOOL)isPureInt:(NSString*)string{
    /*
     NSScanner* scan = [NSScanner scannerWithString:string];
     int val;
     return[scan scanInt:&val] && [scan isAtEnd];
     
     char tmp[128];
     memset(tmp, 0, 128);
     strcpy(tmp, [self UTF8String]);
     */
    for (int i=0; i<[string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if (c<'0' || c > '9') {
            return NO;
        }
    }
    return YES;
}


bool isLetter(char code)
{
    if ((code<='z' && code>='a') || (code<='Z' && code>='A'))
    {
        return true;
    }
    else
    {
        return false;
    }
}
@end
