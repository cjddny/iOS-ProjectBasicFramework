//
//  SystemStaticHelper.m
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "SystemStaticHelper.h"

@interface SystemStaticHelper ()
@property(nonatomic,strong)NSArray *tagsArr;

@end

@implementation SystemStaticHelper

SYNTHESIZE_SINGLETON_FOR_CLASS(SystemStaticHelper)


-(NSArray*)tagsArr
{
    if(_tagsArr==nil)
    {
        NSString *fielPath = [[NSBundle mainBundle] pathForResource:@"InterestPlist" ofType:@"plist"];
        
        NSArray *interetsList=[NSArray arrayWithContentsOfFile:fielPath];
        
        _tagsArr=interetsList;
    }
    
    return _tagsArr;
}

-(NSString*)switchTagsWithType:(NSNumber *)type
{
    NSString *str =@"其他";
    for (NSDictionary *dic in self.tagsArr)
    {
        NSString *tag =[dic objectForKey:type];
    }
    
    return str;
}

@end
