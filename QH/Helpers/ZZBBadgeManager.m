//
//  ZZBBadgeManager.m
//  ZZB
//
//  Created by HuiYang on 15/7/10.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ZZBBadgeManager.h"

@implementation ZZBBadgeManager
SYNTHESIZE_SINGLETON_FOR_CLASS(ZZBBadgeManager)

-(NSInteger)imUnReadMsgCount
{
    NSInteger unReadMsgCount =[[[EaseMob sharedInstance]chatManager] loadTotalUnreadMessagesCountFromDatabase];
    return unReadMsgCount;
}

@end
