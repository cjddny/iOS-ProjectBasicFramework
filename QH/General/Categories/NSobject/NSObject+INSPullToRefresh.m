//
//  NSObject+INSPullToRefresh.m
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "NSObject+INSPullToRefresh.h"

#import "NSObject+INSPullToRefresh.h"
#import "INSCircleInfiniteIndicator.h"
#import "INSCirclePullToRefresh.h"
#import "INSTwitterPullToRefresh.h"
#import "INSDefaultInfiniteIndicator.h"
#import "INSDefaultPullToRefresh.h"
#import "INSVinePullToRefresh.h"
#import "INSPinterestPullToRefresh.h"
#import "INSLabelPullToRefresh.h"
#import "INSLappsyPullToRefresh.h"
#include "INSLappsyInfiniteIndicator.h"


@implementation NSObject (INSPullToRefresh)

- (UIView <INSPullToRefreshBackgroundViewDelegate> *)pullToRefreshViewWithStyle:(INSPullToRefreshStyle)aType
{
    CGRect defaultFrame = CGRectMake(0, 0, 24, 24);
    
    switch (aType)
    {
        case INSPullToRefreshStyleCircle:
            return [[INSCirclePullToRefresh alloc] initWithFrame:defaultFrame];
            break;
        case INSPullToRefreshStyleTwitter:
            return [[INSTwitterPullToRefresh alloc] initWithFrame:defaultFrame];
            break;
        case INSPullToRefreshStyleFacebook:
            return [[INSDefaultPullToRefresh alloc] initWithFrame:defaultFrame backImage:nil frontImage:[UIImage imageNamed:@"iconFacebook"]];
            break;
        case INSPullToRefreshStyleLappsy:
            return [[INSLappsyPullToRefresh alloc] initWithFrame:defaultFrame];
        case INSPullToRefreshStylePinterest:
            return [[INSPinterestPullToRefresh alloc] initWithFrame:defaultFrame logo:[UIImage imageNamed:@"iconPinterestLogo"] backImage:[UIImage imageNamed:@"iconPinterestCircleLight"] frontImage:[UIImage imageNamed:@"iconPinterestCircleDark"]];
            break;
        case INSPullToRefreshStyleVine:
            return [[INSVinePullToRefresh alloc] initWithFrame:defaultFrame];
        case INSPullToRefreshStyleText:
            return [[INSLabelPullToRefresh alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60.0) noneStateText:@"Pull to refresh" triggeredStateText:@"Release to refresh" loadingStateText:@"Loading..."];
        default:
            return [[INSDefaultPullToRefresh alloc] initWithFrame:defaultFrame backImage:[UIImage imageNamed:@"circleLight"] frontImage:[UIImage imageNamed:@"circleDark"]];
            break;
    }
}

- (UIView <INSAnimatable> *)infinityIndicatorViewWithStyle:(INSPullToRefreshStyle)aType
{
    CGRect defaultFrame = CGRectMake(0, 0, 24, 24);
    
    switch (aType) {
        case INSPullToRefreshStyleCircle:
            return [[INSCircleInfiniteIndicator alloc] initWithFrame:defaultFrame];
            break;
        case INSPullToRefreshStyleLappsy:
            return [[INSLappsyInfiniteIndicator alloc] initWithFrame:defaultFrame];
        default:
            return [[INSDefaultInfiniteIndicator alloc] initWithFrame:defaultFrame];
            break;
    }
}

@end
