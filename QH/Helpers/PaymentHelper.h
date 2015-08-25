//
//  PaymentHelper.h
//  ZZB
//
//  Created by jwill on 15/8/13.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

typedef NS_ENUM(NSUInteger, ePaymentType) {
    ePaymentType_Wechat=0,
    ePaymentType_Alipay
};

#import <Foundation/Foundation.h>
#import "WXApi.h"

@interface PaymentHelper : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(PaymentHelper);

+(void)payWithType:(ePaymentType)aType andDic:(NSDictionary*)pramaDic;
@end
