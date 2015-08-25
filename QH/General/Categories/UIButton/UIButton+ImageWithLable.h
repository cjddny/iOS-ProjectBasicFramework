//
//  UIButton+ImageWithLable.h
//  ZZB
//
//  Created by jwill on 15/4/9.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageWithLable)
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType andFont:(UIFont*)aFont andFontColor:(UIColor*)aColor;
@end
