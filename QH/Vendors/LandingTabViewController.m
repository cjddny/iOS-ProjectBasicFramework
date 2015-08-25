//
//  LandingTabViewController.m
//  Dandan
//
//  Created by jwill on 15/4/3.
//  Copyright (c) 2015年 jwill. All rights reserved.
//

#import "LandingTabViewController.h"

@interface LandingTabViewController ()<UITabBarControllerDelegate>

@end

@implementation LandingTabViewController

#pragma mark -- life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate=self;
    [self buildUI];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UI
//基础UI
-(void)buildUI
{
    self.viewControllers=@[[self makeWithRootView:[UIViewController new] title:@"视图1" selectedImg:@""unselectImg:@""],[self makeWithRootView:[UIViewController new] title:@"视图2" selectedImg:@""unselectImg:@""],[self makeWithRootView:[UIViewController new] title:@"视图3" selectedImg:@""unselectImg:@""],[self makeWithRootView:[UIViewController new] title:@"视图4" selectedImg:@""unselectImg:@""]];
}


#pragma mark -- event 

-(UINavigationController*)makeWithRootView:(UIViewController*)aContro
{
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:aContro];
    return nav;
}

-(UINavigationController*)makeWithRootView:(UIViewController*)aContro title:(NSString*)title selectedImg:(NSString*)selectdImg unselectImg:(NSString*)unselectImg
{
    UINavigationController *nav=[self makeWithRootView:aContro];
    nav.title=title;
    nav.tabBarItem.image=[[UIImage imageNamed:unselectImg]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectdImg]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return nav;
}

#pragma mark -- UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
@end
