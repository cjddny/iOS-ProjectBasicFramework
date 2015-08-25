//
//  UIViewController+UIBarButtonItem.m
//  ZZB
//
//  Created by HuiYang on 15/4/17.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UIViewController+UIBarButtonItem.h"
#import "VBFPopFlatButton.h"

@implementation UIViewController (UIBarButtonItem)

-(UIBarButtonItem*)addImageBarButtonWithImageName:(NSString*)imageName action:(SEL)action
{
  
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat ff =1.2;
    
    CGRect frame = CGRectMake(0,0, image.size.width*ff, image.size.height*ff);
    
    //init a normal UIButton using that image
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
//    [button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
//    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
//    
//    [barButtonItem setBackgroundVerticalPositionAdjustment:5 forBarMetrics:UIBarMetricsDefault];
    
    return barButtonItem;
}


-(void)addButtonWithType:(FlatButtonType)stype andSEL:(SEL)action isRight:(BOOL)isR
{
    VBFPopFlatButton* aButton = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20) buttonType:stype
                                                               buttonStyle:buttonPlainStyle
                                                     animateToInitialState:NO];
    aButton.lineThickness = 2;
    aButton.lineRadius=7;
    aButton.tintColor = kAppThemeColor;
    [aButton addTarget:self
                    action:action
          forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *fixBarButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixBarButton.width=-8;
    
    UIBarButtonItem *barBtn =[[UIBarButtonItem alloc]initWithCustomView:aButton];
    
    if (isR)
    {
        self.navigationItem.rightBarButtonItems=@[fixBarButton,barBtn];
    }else
    {
        self.navigationItem.leftBarButtonItems=@[fixBarButton,barBtn];
    }

}

-(void)addImageBarButtonWithImageName:(NSString*)imageName action:(SEL)action isRight:(BOOL)isR
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat ff =1.2;
    
    CGRect frame = CGRectMake(0,0, image.size.width*ff, image.size.height*ff);
    
    //init a normal UIButton using that image
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setShowsTouchWhenHighlighted:YES];

    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *fixBarButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
//    [barButtonItem setTitlePositionAdjustment:UIOffsetMake(100, 0) forBarMetrics:UIBarMetricsDefault];
    
    fixBarButton.width=-8;
    
    if (isR)
    {
        self.navigationItem.rightBarButtonItems=@[fixBarButton,barButtonItem];
    }else
    {
        self.navigationItem.leftBarButtonItems=@[fixBarButton,barButtonItem];
    }
}

@end
