//
//  AFNetworkReachabilityManager+RAC.m
//  FunnyStore
//
//  Created by HuiYang on 14-9-11.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "AFNetworkReachabilityManager+RAC.h"
#import <objc/runtime.h>

@implementation AFNetworkReachabilityManager (RAC)

- (RACSignal *)rac_reachabilityStatusChangeSignal
{
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    
    if (!signal) {
        @weakify(self)
        
        // Creates multicast signal (messages will arrive on all subscribers) which listens for status changes.
        signal = [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            [self setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                [subscriber sendNext:@(status)];
            }];
            return nil;
        }] publish] autoconnect];
        
        // Auto-start monitoring
        [self startMonitoring];
        
        objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return signal;
}

@end
