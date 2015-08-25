//
//  PlaceholderTextView.m
//  ZZB
//
//  Created by HuiYang on 15/3/17.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "PlaceholderTextView.h"

@implementation PlaceholderTextView

- (id)init
{
    self = [super init];
    if (self) {
        [self addTextChangeObserver];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTextChangeObserver];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTextChangeObserver];
    }
    return self;
}

- (void)dealloc
{
    [self removeTextChangeObserver];
}

- (void)addTextChangeObserver
{
    self.placeholderColor = [UIColor grayColor];
    self.placeholderPoint = CGPointMake(8, 8);
    self.maxTextLength    = 0;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)removeTextChangeObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //placeholder
    if ([self isAdd])
    {
        
        CGContextSetFillColorWithColor(context, self.placeholderColor.CGColor);
        CGRect rect = CGRectMake(self.placeholderPoint.x, self.placeholderPoint.y, self.bounds.size.width - self.placeholderPoint.x, self.bounds.size.height - self.placeholderPoint.y);
        [self.placeholder drawInRect:rect withAttributes:[self attributes]];
        //        [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByCharWrapping];
    }
    
}

-(BOOL)isAdd
{
    NSInteger length=self.text.length;
    if (length==1 && ([[self placeholder] length] != 0) && ([[self text]isEqualToString:@" "]))
    {
        return YES;
    }else if (length==0 &&([[self placeholder] length] != 0))
    {
        return YES;
    }else
    {
        return NO;
    }
}

-(NSDictionary*)attributes
{
    UIFont *textFont =[UIFont boldSystemFontOfSize:15];
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *attributes = @{ NSFontAttributeName: textFont,
                                  NSParagraphStyleAttributeName: textStyle,
                                  NSForegroundColorAttributeName: self.placeholderColor};
    return attributes;
}

#pragma mark - Set Method

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textChanged:nil];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    [self textChanged:nil];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self textChanged:nil];
}

- (void)setPlaceholderPoint:(CGPoint)placeholderPoint
{
    _placeholderPoint = placeholderPoint;
    
    [self textChanged:nil];
}

- (void)setMaxTextLength:(NSInteger)maxTextLength
{
    _maxTextLength = maxTextLength;
    
    [self textChanged:nil];
}

- (void)textChanged:(NSNotification *)notification
{
    if (self.maxTextLength > 0 || ([[self placeholder] length] != 0))
    {
        [self setNeedsDisplay];
    }
}
@end
