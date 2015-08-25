//
//  UIView+ZZBInputBar.h
//  ZZB
//
//  Created by HuiYang on 15/3/23.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZBInputBar)

- (void)zzb_pinSubview:(UIView *)subview toEdge:(NSLayoutAttribute)attribute;

- (void)zzb_pinAllEdgesOfSubview:(UIView *)subview;

@end
