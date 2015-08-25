//
//  NSString+TrimingWhitespace.m
//  ZZB
//
//  Created by HuiYang on 15/3/24.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSString+TrimingWhitespace.h"

@implementation NSString (TrimingWhitespace)

- (NSString *)zzb_stringByTrimingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString*)zzb_stringByDeleteWhitespace
{
    NSMutableString *str = [NSMutableString stringWithString:self];
    CFStringTrimWhitespace((__bridge CFMutableStringRef)str);
    return str;
}
@end
