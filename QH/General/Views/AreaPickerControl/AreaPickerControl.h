//
//  AreaPickerControl.h
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AreaPickerControlDelegate <NSObject>

@optional

- (void)selectDoneAreaAdress:(NSString*)area;

@end

@interface AreaPickerControl : NSObject
@property(nonatomic,weak)id <AreaPickerControlDelegate> delegate;

-(void)showAreaPickerControlWithControl:(UIViewController*)control;

@end
