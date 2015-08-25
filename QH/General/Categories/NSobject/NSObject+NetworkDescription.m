//
//  NSObject+NetworkDescription.m
//  ZZB
//
//  Created by HuiYang on 15/3/19.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSObject+NetworkDescription.h"

@implementation NSObject (NetworkDescription)

-(BOOL)isErrorForServer
{
    if (![self isKindOfClass:[NSDictionary class]])
        return NO;
        
    NSDictionary *tem =(NSDictionary*)self;
    NSDictionary *serverDic =[tem objectForKey:@"message"];
    
    if (serverDic)
    {
        if ([[serverDic objectForKey:@"type"] isEqualToString:@"error"])
        {
            NSString *contents =[serverDic objectForKey:@"descript"];
            KAlert(contents);
        }
        return YES;
    }else
    {
        NSString *netErro =[tem objectForKey:@"NSLocalizedDescription"];
        KAlert(netErro);
        return NO;
    }

}

-(BOOL)isSucessForServer
{
    return [self descriptionForServer];
}

-(BOOL)descriptionForServer
{
    if ([self isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *tem =(NSDictionary*)self;
        if (![[tem objectForKey:@"succeeded"] boolValue])
        {
            NSString *arl =[[tem objectForKey:@"message"] objectForKey:@"descript"];
            if (arl.length>1)
            {
               KAlert(arl); 
            }
            return NO;
        }else
        {
            return YES;
        }
        
    }else
    {
     return YES;
    }
}

-(BOOL)isSucessForServerCatchErrorCode:(NSString*)code andCompleteBlock:(ZZBCompleteBlock)cancelBlock
{
    if ([self isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *tem =(NSDictionary*)self;
        
      
        if (![[tem objectForKey:@"succeeded"] boolValue])
        {
            NSString *errorCode =tem[@"code"];
            if ([code isEqualToString:errorCode])
            {
                cancelBlock();
                return NO;
            }
            
            NSString *arl =[[tem objectForKey:@"message"] objectForKey:@"descript"];
            if (arl.length>1)
            {
                KAlert(arl);
            }
            return NO;
        }else
        {
            return YES;
        }
        
    }else
    {
        return YES;
    }
}

@end
