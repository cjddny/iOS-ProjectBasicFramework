//
//  ZZBBadgeManager.h
//  ZZB
//
//  Created by HuiYang on 15/7/10.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZBBadgeManager : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(ZZBBadgeManager);
//环信未读消息数
@property(nonatomic,assign)NSInteger imUnReadMsgCount;

@end
