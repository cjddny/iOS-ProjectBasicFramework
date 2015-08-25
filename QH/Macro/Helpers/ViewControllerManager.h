//
//  ViewControllerManager.h
//  ZZB
//
//  Created by jwill on 15/6/11.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

/**
 *  用于视图控制器的静态存储
 *
 */

#import <Foundation/Foundation.h>

@interface ViewControllerManager : NSObject
+(instancetype)sharedInstance;
//清空当前vc
-(void)clearCurVC;
//加载当前vc
-(UIViewController*)getCurVC;
//设置curVC
-(void)addCurrentVC:(UIViewController*)aVc;

@end
