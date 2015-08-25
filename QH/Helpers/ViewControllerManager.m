//
//  ViewControllerManager.m
//  ZZB
//
//  Created by jwill on 15/6/11.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ViewControllerManager.h"
static __weak UIViewController* curVC;

@implementation ViewControllerManager
+(instancetype)sharedInstance{
    static id sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//清空当前vc
-(void)clearCurVC
{
    curVC=nil;
}
//加载当前vc
-(UIViewController*)getCurVC
{
    return curVC;
}


//设置curVC
-(void)addCurrentVC:(UIViewController*)aVc
{
    curVC=aVc;
    
}
@end
