//
//  NSString+TrimingWhitespace.h
//  ZZB
//
//  Created by HuiYang on 15/3/24.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TrimingWhitespace)
/**
 *  @return A copy of the receiver with all leading and trailing whitespace removed.
 */
- (NSString *)zzb_stringByTrimingWhitespace;
-(NSString*)zzb_stringByDeleteWhitespace;

@end
