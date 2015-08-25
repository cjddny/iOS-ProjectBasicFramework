//
//  NSObject+NetworkDescription.h
//  ZZB
//
//  Created by HuiYang on 15/3/19.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^ZZBCompleteBlock)(void);

@interface NSObject (NetworkDescription)

-(BOOL)descriptionForServer;
-(BOOL)isSucessForServer;

-(BOOL)isErrorForServer;

-(BOOL)isSucessForServerCatchErrorCode:(NSString*)code andCompleteBlock:(ZZBCompleteBlock)cancelBlock;

@end
