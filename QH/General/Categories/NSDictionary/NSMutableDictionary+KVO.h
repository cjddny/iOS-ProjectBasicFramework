//
//  NSMutableDictionary+KVO.h
//  ZZB
//
//  Created by HuiYang on 15/3/27.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSMutableDictionarySetObjectBlock)();

@interface NSMutableDictionary (KVO)

@property (nonatomic, strong) NSMutableDictionarySetObjectBlock setObjBlock;

-(void)setKVOObject:(id)anObject forKey:(NSString*)aKey;

@end
