//
//  Province.m
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "Province.h"
#import "City.h"

@implementation Province
- (instancetype)initWithDic:(NSDictionary *)infoDic {
    if (self = [super init])
    {
        self.province = [infoDic objectForKey:@"state"];
        NSArray *cityInfoArray = [infoDic objectForKey:@"cities"];
        self.cityArray = [[NSMutableArray alloc] init];
        [cityInfoArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            City *aCity = [[City alloc] initWithDic:(NSDictionary *)obj];
            [self.cityArray addObject:aCity];
        }];
    }
    return self;
}
@end
