//
//  UITableViewCell+SeperatorLine.m
//  ZZB
//
//  Created by jwill on 15/8/3.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIView+SeperatorLine.h"

@implementation UIView(SeperatorLine)
//default
-(void)addBottomLine
{
    CALayer *lineLayer=[self layerAddLineUp:FALSE andColor:ZZBSeperatorLineColor.CGColor withLeftOffset:0 withRightOffset:0];
    [self.layer addSublayer:lineLayer];
}

//头部全覆盖线
-(void)addTopLine
{
    CALayer *lineLayer=[self layerAddLineUp:TRUE andColor:ZZBSeperatorLineColor.CGColor withLeftOffset:0 withRightOffset:0];
    [self.layer addSublayer:lineLayer];
}


-(void)addLeftOffsetLine:(CGFloat)leftOffset
{
    CALayer *lineLayer=[self layerAddLineUp:FALSE andColor:ZZBSeperatorLineColor.CGColor withLeftOffset:leftOffset withRightOffset:0];
    [self.layer addSublayer:lineLayer];
}

//两侧偏移线
-(void)addBothOffsetLine:(CGFloat)offset
{
    CALayer *lineLayer=[self layerAddLineUp:FALSE andColor:ZZBSeperatorLineColor.CGColor withLeftOffset:offset withRightOffset:offset];
    [self.layer addSublayer:lineLayer];
}


//draw Line
- (CALayer*)layerAddLineUp:(BOOL)isUp andColor:(CGColorRef)color withLeftOffset:(CGFloat)leftSpace withRightOffset:(CGFloat)rightSpace{
    
    CALayer *lineLayer = [CALayer new];
    CGFloat lineHeight = 0.7f;
    CGFloat top;
    if (isUp) {
        top = 0;
    }else{
        top = self.frame.size.height-lineHeight;
    }
    lineLayer.frame = CGRectMake(self.frame.origin.x+leftSpace, top, self.frame.size.width-leftSpace-rightSpace, lineHeight);
    lineLayer.backgroundColor = color;
    return lineLayer;
}

@end
