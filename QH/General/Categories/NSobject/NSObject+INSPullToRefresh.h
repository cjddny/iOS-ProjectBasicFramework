//
//  NSObject+INSPullToRefresh.h
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+INSPullToRefresh.h"
#import "INSAnimatable.h"

typedef NS_ENUM(NSUInteger, INSPullToRefreshStyle)
{
    INSPullToRefreshStyleDefault = 0,
    INSPullToRefreshStyleCircle,
    INSPullToRefreshStyleTwitter,
    INSPullToRefreshStyleFacebook,
    INSPullToRefreshStyleLappsy,
    INSPullToRefreshStyleVine,
    INSPullToRefreshStylePinterest,
    INSPullToRefreshStyleText,
    INSPullToRefreshStylePreserveContentInset
};

@interface NSObject (INSPullToRefresh)

- (UIView <INSPullToRefreshBackgroundViewDelegate> *)pullToRefreshViewWithStyle:(INSPullToRefreshStyle)type;

- (UIView <INSAnimatable> *)infinityIndicatorViewWithStyle:(INSPullToRefreshStyle)type;

@end
