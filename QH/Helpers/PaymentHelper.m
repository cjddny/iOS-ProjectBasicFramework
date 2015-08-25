//
//  PaymentHelper.m
//  ZZB
//
//  Created by jwill on 15/8/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "PaymentHelper.h"
#import "payRequsestHandler.h"

@implementation PaymentHelper
SYNTHESIZE_SINGLETON_FOR_CLASS(PaymentHelper)

+(void)payWithType:(ePaymentType)aType andDic:(NSDictionary*)pramaDic
{
    if (aType==ePaymentType_Wechat) {
        PayReq* req             = [[PayReq alloc] init];
        req.openID              = pramaDic[@"appid"];
        req.partnerId           = pramaDic[@"partnerid"];
        req.prepayId            = pramaDic[@"prepayid"];
        req.nonceStr            = pramaDic[@"noncestr"];
        req.timeStamp           = [pramaDic[@"timestamp"] intValue];
        req.package             = pramaDic[@"package"];
        req.sign                = pramaDic[@"sign"];
        NSLog(@"partnerid:%@\nprepayid:%@\nnoncestr:%@\ntimestamp:%d\npackage:%@\nsign:%@",req.partnerId,req.prepayId,req.nonceStr,(unsigned int)req.timeStamp,req.package,req.sign);
        [WXApi safeSendReq:req];
    }
}
@end
