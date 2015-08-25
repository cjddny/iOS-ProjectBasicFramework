//
//  City.m
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "City.h"

@implementation City
- (instancetype)initWithDic:(NSDictionary *)infoDic {
    if (self = [super init]) {
        self.city = [infoDic objectForKey:@"city"];
        self.areaArray = [infoDic objectForKey:@"areas"];
    }
    return self;
}

@end
