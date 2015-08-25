//
//  MarginLabel.m
//  ZZB
//
//  Created by jwill on 15/6/15.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "MarginLabel.h"

@implementation MarginLabel

-(id) initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if(self){
        self.insets = insets;
    }
    return self;
}

-(id) initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if(self){
        self.insets = insets;
    }
    return self;
}

-(void) drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
