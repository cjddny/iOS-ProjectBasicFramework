//
//  UILabel+LabelAutoLenght.m
//  Dandan
//
//  Created by HuiYang on 15/6/1.
//  Copyright (c) 2015年 jwill. All rights reserved.
//

#import "UILabel+LabelAutoLenght.h"

@implementation UILabel (LabelAutoLenght)

-(CGSize)autoSize
{
    CGRect textFrame = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10, CGFLOAT_MAX)
                                               options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                            attributes:@{ NSFontAttributeName : self.font }
                                               context:nil];
    //    CGFloat adj = ceilf(self.font.ascender - self.font.capHeight)-3;
    //    CGFloat add=font.lineHeight;
    //    CGFloat height =textFrame.size.height+adj;
    //    CGFloat width =textFrame.size.width+adj;
    
    CGSize zz =CGSizeMake(textFrame.size.width, textFrame.size.height);
    return zz;
}

-(CGFloat)autoWidth
{
    return [self autoSize].width;
}

-(CGFloat)autoHeight
{
    return [self autoSize].height;
}

@end
