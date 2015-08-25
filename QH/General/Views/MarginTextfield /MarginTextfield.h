//
//  MarginTextfield.h
//  FunnyStore
//
//  Created by HuiYang on 14-10-25.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHSPhoneTextField.h"

@interface MarginTextfield : UITextField

@property (nonatomic, assign) CGFloat leftMargin;
@property (nonatomic, assign) CGFloat rightMargin;

@end

@interface MarginPhoneTextField : SHSPhoneTextField

@property (nonatomic, assign) CGFloat leftMargin;
@property (nonatomic, assign) CGFloat rightMargin;

@end