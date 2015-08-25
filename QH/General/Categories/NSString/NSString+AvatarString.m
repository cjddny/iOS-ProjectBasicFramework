//
//  NSString+AvatarString.m
//  FunnyStore
//
//  Created by HuiYang on 14-10-18.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "NSString+AvatarString.h"

@implementation NSString (AvatarString)

-(NSURL*)AvatarIcon200x200
{
    NSString *str=@"";
    if ([self hasPrefix:@"http://"] && ![self hasSuffix:kAvatar200x200])
    {
        str =[NSString stringWithFormat:@"%@%@",self,kAvatar200x200];
    }else if ([self hasSuffix:kAvatar200x200])
    {
        str=self;
    }
    
    return [NSURL URLWithString:str];
}

@end
