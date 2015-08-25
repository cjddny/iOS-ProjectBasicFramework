//
//  AFNetworkReachabilityManager+RAC.h
//  FunnyStore
//
//  Created by HuiYang on 14-9-11.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "AFNetworkReachabilityManager.h"

@interface AFNetworkReachabilityManager (RAC)

- (RACSignal *)rac_reachabilityStatusChangeSignal;

@end
