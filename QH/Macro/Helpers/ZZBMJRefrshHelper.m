//
//  ZZBMJRefrshHelper.m
//  ZZB
//
//  Created by jwill on 15/8/12.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ZZBMJRefrshHelper.h"

static NSArray* loadingArr;

@implementation ZZBMJRefrshHelper
SYNTHESIZE_SINGLETON_FOR_CLASS(ZZBMJRefrshHelper)


-(MJRefreshGifHeader*)getGifRefreshHeaderWithCompleteBlock:(void(^)())completeHandler
{
    if ([loadingArr count]==0) {
        int random = arc4random()%2;
        loadingArr=(random)?@[[UIImage imageNamed:@"ManLoadingS1"],
                                       [UIImage imageNamed:@"ManLoadingS2"],
                                       [UIImage imageNamed:@"ManLoadingS3"],
                                       [UIImage imageNamed:@"ManLoadingS4"],
                                       [UIImage imageNamed:@"ManLoadingS5"],
                                       [UIImage imageNamed:@"ManLoadingS6"],
                                       [UIImage imageNamed:@"ManLoadingS7"],
                                       [UIImage imageNamed:@"ManLoadingS8"],
                                       [UIImage imageNamed:@"ManLoadingS9"]
                                       ]:@[[UIImage imageNamed:@"WomanLoadingS1"],
                                           [UIImage imageNamed:@"WomanLoadingS2"],
                                           [UIImage imageNamed:@"WomanLoadingS3"],
                                           [UIImage imageNamed:@"WomanLoadingS4"],
                                           [UIImage imageNamed:@"WomanLoadingS5"],
                                           [UIImage imageNamed:@"WomanLoadingS6"],
                                           [UIImage imageNamed:@"WomanLoadingS7"],
                                           [UIImage imageNamed:@"WomanLoadingS8"],
                                           [UIImage imageNamed:@"WomanLoadingS9"]
                                           ];
    }
    
    __autoreleasing MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        completeHandler();
    }];
    [header setImages:loadingArr forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:loadingArr forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:loadingArr forState:MJRefreshStateRefreshing];
    
    return header;
}


//普通下拉刷新
-(MJRefreshAutoNormalFooter*)getNormalRefreshFooterWithCompleteBlock:(void(^)())completeHandler
{
    __autoreleasing MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        completeHandler();
    }];
    footer.refreshingTitleHidden = YES;
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];

    return footer;
}
@end
