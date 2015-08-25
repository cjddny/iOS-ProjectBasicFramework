//  FunnyStore
//
//  Created by HuiYang on 14-8-17.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SVHUD)

-(void)showSVhudNoText;
-(void)showSVWithStatus:(NSString*)status;
-(void)showSVSuccessWithStatus:(NSString*)status;
-(void)showSVErrorWithStatus:(NSString*)status;
-(void)hideSVHud;

@end
