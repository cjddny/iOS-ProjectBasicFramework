//
//  UIViewController+Login.m
//  ZZB
//
//  Created by HuiYang on 15/3/19.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIViewController+Login.h"
#import "AccountManager.h"

@interface UIViewController ()

@end

@implementation UIViewController (Login)

-(BOOL)checkIfLogin
{

    BOOL isLogin =[AccountManager isLogin];
    
    if (!isLogin)
    {
    }
    return isLogin;
}



@end
