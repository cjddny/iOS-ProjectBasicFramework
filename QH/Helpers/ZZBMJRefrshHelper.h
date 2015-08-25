//
//  ZZBMJRefrshHelper.h
//  ZZB
//
//  Created by jwill on 15/8/12.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJRefresh.h"

@interface ZZBMJRefrshHelper : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(ZZBMJRefrshHelper);

//动图头部下拉刷新
-(MJRefreshGifHeader*)getGifRefreshHeaderWithCompleteBlock:(void(^)())completeHandler;

//普通下拉刷新
-(MJRefreshAutoNormalFooter*)getNormalRefreshFooterWithCompleteBlock:(void(^)())completeHandler;

@end
