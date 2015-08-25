//
//  ShareHelper.h
//  ZZB
//
//  Created by jwill on 15/8/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

typedef NS_ENUM(NSUInteger, EShareType) {
    EShareType_Activity=0,
    EShareType_Commodity=1,
    EShareType_App=2
};

#import <Foundation/Foundation.h>

@interface ShareHelper : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(ShareHelper);
//分享图文
-(void)shareWithImage:(UIImage*)aImg text:(NSString*)text type:(EShareType)aType id:(NSString*)id onViewController:(UIViewController*)aVc;

//根据缓存url分享图文
-(void)shareWithImageUrl:(NSString*)url text:(NSString*)text type:(EShareType)aType id:(NSString*)id onViewController:(UIViewController*)aVc;

@end
