//
//  NSString+TagsSwitch.m
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSString+TagsSwitch.h"

//travel	旅行
//sing	    唱歌
//sport	体育
//photography	摄影
//chess	棋牌
//dance	跳舞
//calligraphy	书画
//health	养生
//drama	戏剧
//other	其他

@implementation NSString (TagsSwitch)

-(NSString*)enSwitchCH
{
    if (![self isKindOfClass:[NSString class]])
        return @"";
    
    NSString * str=@"";
    if ([self isEqualToString:@"travel"])
    {
        str=@"旅行";
    }else if ([self isEqualToString:@"sing"])
    {
        str=@"唱歌";
    }else if ([self isEqualToString:@"sport"])
    {
        str=@"体育";
    }else if ([self isEqualToString:@"photography"])
    {
        str=@"摄影";
    }else if ([self isEqualToString:@"chess"])
    {
        str=@"棋牌";
    }else if ([self isEqualToString:@"dance"])
    {
        str=@"跳舞";
    }else if ([self isEqualToString:@"calligraphy"])
    {
        str=@"书画";
    }else if ([self isEqualToString:@"health"])
    {
        str=@"养生";
    }else if ([self isEqualToString:@"drama"])
    {
        str=@"戏剧";
    }else if ([self isEqualToString:@"other"])
    {
        str=@"其他";
    }
    
    return str;
}

-(NSString*)chSwitchEN
{
    if (![self isKindOfClass:[NSString class]])
        return @"";
    
    NSString * str=@"";
    if ([self isEqualToString:@"旅行"])
    {
        str=@"travel";
    }else if ([self isEqualToString:@"唱歌"])
    {
        str=@"sing";
    }else if ([self isEqualToString:@"体育"])
    {
        str=@"sport";
    }else if ([self isEqualToString:@"摄影"])
    {
        str=@"photography";
    }else if ([self isEqualToString:@"棋牌"])
    {
        str=@"chess";
    }else if ([self isEqualToString:@"跳舞"])
    {
        str=@"dance";
    }else if ([self isEqualToString:@"书画"])
    {
        str=@"calligraphy";
    }else if ([self isEqualToString:@"养生"])
    {
        str=@"health";
    }else if ([self isEqualToString:@"戏剧"])
    {
        str=@"drama";
    }else if ([self isEqualToString:@"其他"])
    {
        str=@"other";
    }
    
    return str;
}

@end
