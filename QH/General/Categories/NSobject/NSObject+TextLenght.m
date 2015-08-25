//
//  NSObject+TextLenght.m
//  ZZB
//
//  Created by HuiYang on 15/4/27.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSObject+TextLenght.h"

@implementation NSObject (TextLenght)

+(CGSize)textContentSizeWithContent:(NSString*)text andFont:(UIFont*)font
{
    
    CGRect textFrame = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10, CGFLOAT_MAX)
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:@{ NSFontAttributeName : font }
                                          context:nil];
    CGFloat adj = ceilf(font.ascender - font.capHeight)-3;
    //    CGFloat add=font.lineHeight;
    CGFloat height =textFrame.size.height+adj;
    
    CGSize zz =CGSizeMake(textFrame.size.width, height);
    return zz;
    
}

@end
