//
//  Province.h
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject
@property (nonatomic , copy) NSString *province;
@property (nonatomic , copy) NSString *provinceCode;
@property (nonatomic , strong) NSMutableArray *cityArray;
- (instancetype)initWithDic:(NSDictionary *)infoDic;
@end
