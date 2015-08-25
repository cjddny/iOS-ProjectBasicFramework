//
//  NSString+MessageInputView.h
//  FunnyStore
//
//  Created by HuiYang on 14-9-16.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MessageInputView)

- (NSString *)stringByTrimingWhitespace;
- (NSUInteger)numberOfLines;
@end
