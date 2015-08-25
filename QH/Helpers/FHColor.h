//
//  FHColor.h
//  FunnyStore
//
//  Created by HuiYang on 14-8-13.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#define FHColor UIColor
#else
#import <Foundation/Foundation.h>
#define FHColor NSColor
#endif

@interface FHColor (FHColorAddition)

+ (FHColor *)colorWithHexStringN:(NSString *)hexString;
+ (FHColor *)colorWithHexStringN:(NSString *)hexString alpha:(CGFloat)alpha;

+ (FHColor *)colorWith8BitRedN:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (FHColor *)colorWith8BitRedN:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

@end