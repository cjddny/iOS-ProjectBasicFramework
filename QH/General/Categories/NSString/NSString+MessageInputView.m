//
//  NSString+MessageInputView.m
//  FunnyStore
//
//  Created by HuiYang on 14-9-16.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "NSString+MessageInputView.h"

@implementation NSString (MessageInputView)

- (NSString *)stringByTrimingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)numberOfLines {
    return [[self componentsSeparatedByString:@"\n"] count] + 1;
}

@end
