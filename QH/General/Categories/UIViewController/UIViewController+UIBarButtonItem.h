//
//  UIViewController+UIBarButtonItem.h
//  ZZB
//
//  Created by HuiYang on 15/4/17.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBFPopFlatButton.h"

@interface UIViewController (UIBarButtonItem)

-(UIBarButtonItem*)addImageBarButtonWithImageName:(NSString*)imageName action:(SEL)action;

-(void)addButtonWithType:(FlatButtonType)stype andSEL:(SEL)action isRight:(BOOL)isR;

-(void)addImageBarButtonWithImageName:(NSString*)imageName action:(SEL)action isRight:(BOOL)isR;

@end
