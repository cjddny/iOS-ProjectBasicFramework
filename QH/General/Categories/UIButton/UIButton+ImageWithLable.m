//
//  UIButton+ImageWithLable.m
//  ZZB
//
//  Created by jwill on 15/4/9.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIButton+ImageWithLable.h"

@implementation UIButton (ImageWithLable)

- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType andFont:(UIFont*)aFont andFontColor:(UIColor*)aColor
{
    float offset=10.0;
    
    CGSize titleSize = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:aFont,NSFontAttributeName, nil]];
    NSLog(@"titleZize:-----%f",titleSize.width);
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                              0.0,
                                              0.0,
                                              titleSize.width/2)];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:aFont];
    [self.titleLabel setTextColor:aColor];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0,
                                              0.0,
                                              0.0,
                                              0.0)];
    [self setTitle:title forState:stateType];
}

@end
