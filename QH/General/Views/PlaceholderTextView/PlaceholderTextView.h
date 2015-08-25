//
//  PlaceholderTextView.h
//  ZZB
//
//  Created by HuiYang on 15/3/17.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView

@property (nonatomic, copy)         NSString   *placeholder;            // default is nil.
@property (nonatomic, strong)       UIColor    *placeholderColor;       // default is [UIColor grayColor];.
@property (nonatomic)               CGPoint     placeholderPoint;       // default is (8,8)
@property (nonatomic)               NSInteger   maxTextLength;          // default is 0.
@end
