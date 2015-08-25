//
//  NSMutableDictionary+KVO.m
//  ZZB
//
//  Created by HuiYang on 15/3/27.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSMutableDictionary+KVO.h"
#import <objc/runtime.h>

static char setObjBlockKey;

@implementation NSMutableDictionary (KVO)

#pragma mark - Getter methods

- (NSMutableDictionarySetObjectBlock)setObjBlock
{
    return objc_getAssociatedObject(self, &setObjBlockKey);
}

#pragma mark - Setter methods

- (void)setSetObjBlock:(NSMutableDictionarySetObjectBlock)setObjBlock
{
    if (!setObjBlock) {
        return;
    }
    
    objc_setAssociatedObject(self, &setObjBlockKey, setObjBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setKVOObject:(id)anObject forKey:(NSString*)aKey
{
    [self setValue:anObject forKey:aKey];
    
    if (self.setObjBlock) {
        self.setObjBlock();
    }
}

@end
