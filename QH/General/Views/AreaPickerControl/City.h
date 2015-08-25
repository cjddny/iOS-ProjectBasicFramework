//
//  City.h
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (nonatomic , copy) NSString *city;
@property (nonatomic , copy) NSString *cityCode;
@property (nonatomic , strong) NSArray *areaArray;

- (instancetype)initWithDic:(NSDictionary *)infoDic;
@end
