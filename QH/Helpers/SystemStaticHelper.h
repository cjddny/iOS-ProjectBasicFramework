//
//  SystemStaticHelper.h
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemStaticHelper : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(SystemStaticHelper);

-(NSString*)switchTagsWithType:(NSNumber*)type;
@end
