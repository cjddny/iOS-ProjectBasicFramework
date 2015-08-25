//
//  MarginTextfield.m
//  FunnyStore
//
//  Created by HuiYang on 14-10-25.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import "MarginTextfield.h"

@implementation MarginTextfield

- (CGRect)textRectForBounds:(CGRect)bounds
{
    
    CGFloat allowanceForClearButton = 0.0;
    if (self.clearButtonMode == UITextFieldViewModeAlways || self.clearButtonMode == UITextFieldViewModeUnlessEditing) {
        allowanceForClearButton = 25.0;
    }
    
    CGRect frm = bounds;
    frm.origin.x += self.leftMargin;
    frm.size.width -= (self.leftMargin + self.rightMargin + allowanceForClearButton);
    
    return frm;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    
    CGFloat allowanceForClearButton = 0.0;
    if (self.clearButtonMode == UITextFieldViewModeAlways || self.clearButtonMode == UITextFieldViewModeWhileEditing) {
        allowanceForClearButton = 25.0;
    }
    
    CGRect frm = bounds;
    frm.origin.x += self.leftMargin;
    frm.size.width -= (self.leftMargin + self.rightMargin + allowanceForClearButton);
    
    return frm;
}

@end

@implementation MarginPhoneTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    
    CGFloat allowanceForClearButton = 0.0;
    if (self.clearButtonMode == UITextFieldViewModeAlways || self.clearButtonMode == UITextFieldViewModeUnlessEditing) {
        allowanceForClearButton = 25.0;
    }
    
    CGRect frm = bounds;
    frm.origin.x += self.leftMargin;
    frm.size.width -= (self.leftMargin + self.rightMargin + allowanceForClearButton);
    
    return frm;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    
    CGFloat allowanceForClearButton = 0.0;
    if (self.clearButtonMode == UITextFieldViewModeAlways || self.clearButtonMode == UITextFieldViewModeWhileEditing) {
        allowanceForClearButton = 25.0;
    }
    
    CGRect frm = bounds;
    frm.origin.x += self.leftMargin;
    frm.size.width -= (self.leftMargin + self.rightMargin + allowanceForClearButton);
    
    return frm;
}

@end
