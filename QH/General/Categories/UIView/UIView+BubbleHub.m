//
//  UIView+BubbleHub.m
//  ZZB
//
//  Created by jwill on 15/7/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIView+BubbleHub.h"
#import <objc/runtime.h>

@implementation UIView (BubbleHub)

- (id)hub {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHub:(id)hub {
    objc_setAssociatedObject(self, @selector(hub), hub, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//+ (NSString *)associatedObject {
//    return objc_getAssociatedObject([self class], _cmd);
//}
//
//+ (void)setAssociatedObject:(NSString *)associatedObject {
//    objc_setAssociatedObject([self class], @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}


@end
