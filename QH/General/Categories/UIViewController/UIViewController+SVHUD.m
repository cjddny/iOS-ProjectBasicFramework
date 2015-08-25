//  FunnyStore
//
//  Created by HuiYang on 14-8-17.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "UIViewController+SVHUD.h"
#import "SVProgressHUD.h"

@implementation UIViewController (SVHUD)

-(void)showSVhudNoText
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
}

-(void)showSVWithStatus:(NSString *)status
{
    [SVProgressHUD showWithStatus:status maskType:SVProgressHUDMaskTypeClear];
}

-(void)showSVSuccessWithStatus:(NSString *)status
{
    [SVProgressHUD showSuccessWithStatus:status ];
}

-(void)showSVErrorWithStatus:(NSString *)status
{
    [SVProgressHUD showErrorWithStatus:status];
}

-(void)hideSVHud
{
    [SVProgressHUD dismiss];
}

@end
