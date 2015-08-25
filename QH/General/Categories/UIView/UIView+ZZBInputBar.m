//
//  UIView+ZZBInputBar.m
//  ZZB
//
//  Created by HuiYang on 15/3/23.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIView+ZZBInputBar.h"

@implementation UIView (ZZBInputBar)

- (void)zzb_pinSubview:(UIView *)subview toEdge:(NSLayoutAttribute)attribute
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:attribute
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:attribute
                                                    multiplier:1.0f
                                                      constant:0.0f]];
}

- (void)zzb_pinAllEdgesOfSubview:(UIView *)subview
{
    [self zzb_pinSubview:subview toEdge:NSLayoutAttributeBottom];
    [self zzb_pinSubview:subview toEdge:NSLayoutAttributeTop];
    [self zzb_pinSubview:subview toEdge:NSLayoutAttributeLeading];
    [self zzb_pinSubview:subview toEdge:NSLayoutAttributeTrailing];
}

@end
