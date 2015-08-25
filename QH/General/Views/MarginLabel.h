//
//  MarginLabel.h
//  ZZB
//
//  Created by jwill on 15/6/15.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarginLabel : UILabel
@property(nonatomic) UIEdgeInsets insets;
-(id) initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;
-(id) initWithInsets: (UIEdgeInsets) insets;
@end
