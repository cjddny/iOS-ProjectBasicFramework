//
//  LandingTabViewController.m
//  Dandan
//
//  Created by jwill on 15/4/3.
//  Copyright (c) 2015年 jwill. All rights reserved.
//

#import "LandingTabViewController.h"
#import "DiscoverViewController.h"
#import "InloveViewController.h"
#import "SquareViewController.h"
#import "MyViewController.h"
//#import "SerendipityVIewController.h"
#import "RelationViewController.h"
#import "SerendipityMVIewController.h"

@interface LandingTabViewController ()<UITabBarControllerDelegate>

@end

@implementation LandingTabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.tabBar.barTintColor=colorFromHex(@"27283c");
    self.delegate=self;

    [self buildUI];
    
    // Do any additional setup after loading the view.
}


-(void)buildUI
{
    UINavigationController *nav1 =[self conTraseWithRootView:[SerendipityMVIewController new]];
    nav1.tabBarItem.title=@"邂逅";
//    nav1.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    UINavigationController *nav2 =[self conTraseWithRootView:[DiscoverViewController new]];
    nav2.tabBarItem.title=@"发现";
    UINavigationController *nav3 =[self conTraseWithRootView:[RelationViewController new]];
    nav3.tabBarItem.title=@"人脉";
    UINavigationController *nav4 =[self conTraseWithRootView:[InloveViewController new]];
    nav4.tabBarItem.title=@"缘分";
    UINavigationController *nav5 =[self conTraseWithRootView:[MyViewController new]];
    nav5.tabBarItem.title=@"我的";
    
//    if (!IsAfterIOS8) {
        nav1.navigationBar.translucent = NO;
        nav2.navigationBar.translucent = NO;
        nav3.navigationBar.translucent = NO;
        nav4.navigationBar.translucent = NO;
        nav5.navigationBar.translucent = NO;
//    }

    NSArray *navArr =[NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5, nil];
    
    //缘分
    UIImage *oneImageSel = [[UIImage imageNamed:@"tabbar_serendipity_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *oneImageUnSel = [[UIImage imageNamed:@"tabbar_serendipity_unselect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav1.tabBarItem.image=oneImageUnSel;
    nav1.tabBarItem.selectedImage=oneImageSel;

    
    //发现
    UIImage *twoImageSel = [[UIImage imageNamed:@"tabbar_discover_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *twoImageUnSel = [[UIImage imageNamed:@"tabbar_discover_unselect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav2.tabBarItem.image=twoImageUnSel;
    nav2.tabBarItem.selectedImage=twoImageSel;

    
    //人脉
    UIImage *threeImageSel = [[UIImage imageNamed:@"tabbar_relationship_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *threeImageUnSel = [[UIImage imageNamed:@"tabbar_relationship_unselect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.image=threeImageUnSel;
    nav3.tabBarItem.selectedImage=threeImageSel;
    
    //追求
    UIImage *fourImageSel = [[UIImage imageNamed:@"tabbar_inlove_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *fourImageUnSel = [[UIImage imageNamed:@"tabbar_inlove_unselect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.image=fourImageUnSel;
    nav4.tabBarItem.selectedImage=fourImageSel;

    //我的
    UIImage *fiveImageSel = [[UIImage imageNamed:@"tabbar_my_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *fiveImageUnSel = [[UIImage imageNamed:@"tabbar_my_unselect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.image=fiveImageUnSel;
    nav5.tabBarItem.selectedImage=fiveImageSel;
    
    
    self.viewControllers=navArr;
}

-(UINavigationController*)conTraseWithRootView:(UIViewController*)aContro
{
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:aContro];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    MyViewController *vc=(MyViewController*)[(UINavigationController*)[[tabBarController viewControllers] lastObject] topViewController];
    vc.flush=NO;
}
@end
