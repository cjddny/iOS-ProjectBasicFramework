//
//  UITableViewCell+SeperatorLine.h
//  ZZB
//
//  Created by jwill on 15/8/3.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(SeperatorLine)
//底部全覆盖线
-(void)addBottomLine;
//头部全覆盖线
-(void)addTopLine;
//左侧偏移线
-(void)addLeftOffsetLine:(CGFloat)leftOffset;
//两侧偏移线
-(void)addBothOffsetLine:(CGFloat)offset;

@end
