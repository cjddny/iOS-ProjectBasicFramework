//
//  FHColor.m
//  FunnyStore
//
//  Created by HuiYang on 14-8-13.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "FHColor.h"

@implementation FHColor (FHColorAddition)

+ (FHColor *)colorWithHexStringN:(NSString *)hexString
{
    return [[self class] colorWithHexStringN:hexString alpha:1.0];
}

+ (FHColor *)colorWithHexStringN:(NSString *)hexString alpha:(CGFloat)alpha
{
    // Check for hash and add the missing hash
    if('#' != [hexString characterAtIndex:0])
    {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    
    // check for string length
    assert(7 == hexString.length || 4 == hexString.length);
    
    // check for 3 character HexStrings
    hexString = [[self class] hexStringTransformFromThreeCharacters:hexString];
    
    NSString *redHex    = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt = [[self class] hexValueToUnsigned:redHex];
    
    NSString *greenHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt = [[self class] hexValueToUnsigned:greenHex];
    
    NSString *blueHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt = [[self class] hexValueToUnsigned:blueHex];
    
    FHColor *color = [FHColor colorWith8BitRedN:redInt green:greenInt blue:blueInt alpha:alpha];
    
    return color;
}

+ (FHColor *)colorWith8BitRedN:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    return [[self class] colorWith8BitRedN:red green:green blue:blue alpha:1.0];
}

+ (FHColor *)colorWith8BitRedN:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha
{
    FHColor *color = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    color = [FHColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#else
    color = [FHColor colorWithCalibratedRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#endif
    
    return color;
}

+ (NSString *)hexStringTransformFromThreeCharacters:(NSString *)hexString
{
    if(hexString.length == 4)
    {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                     [hexString substringWithRange:NSMakeRange(1, 1)],[hexString substringWithRange:NSMakeRange(1, 1)],
                     [hexString substringWithRange:NSMakeRange(2, 1)],[hexString substringWithRange:NSMakeRange(2, 1)],
                     [hexString substringWithRange:NSMakeRange(3, 1)],[hexString substringWithRange:NSMakeRange(3, 1)]];
    }
    
    return hexString;
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue
{
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

@end
