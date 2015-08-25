//
//  UITableViewController+UIActivityIndicatorView.m
//  ZZB
//
//  Created by HuiYang on 15/3/25.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "UITableViewController+UIActivityIndicatorView.h"
#import <objc/runtime.h>

static char const * const activityIndicatorViewKey = "activityIndicatorViewKey";

@interface UITableViewController (XUIActivityIndicatorView)

@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;

@end

@implementation UITableViewController (UIActivityIndicatorView)

#pragma mark - Properties
- (UIActivityIndicatorView *)indicatorView {
    return objc_getAssociatedObject(self, activityIndicatorViewKey);
}

- (void)setIndicatorView:(UIActivityIndicatorView *)indicatorView{
    objc_setAssociatedObject(self, activityIndicatorViewKey, indicatorView, OBJC_ASSOCIATION_ASSIGN);
}

-(void)showActivityIndicator
{
//    UIActivityIndicatorView *av =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    CGSize screen =self.view.bounds.size;
//    av.center = CGPointMake(screen.width / 2, screen.height / 2 );
//    [self.navigationController.view addSubview:av];
//    [av startAnimating];
//    self.indicatorView=av;
    
}

-(void)hideActivityIndicator
{
//    if (self.indicatorView)
//    {
//       [self.indicatorView stopAnimating];
//        self.indicatorView=nil;
//        
//    }
}
@end
