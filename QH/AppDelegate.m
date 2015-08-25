//
//  AppDelegate.m
//  QH
//
//  Created by jwill on 15/8/19.
//  Copyright (c) 2015年 jwill. All rights reserved.
//

#import "AppDelegate.h"
#import "LandingTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark -- life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self initDrawer];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -- UI
//用于刷新，及新建主视图
- (void)initDrawer
{
    self.window.rootViewController = [LandingTabViewController new];
}

//app自定义
-(void)configAppSetting
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:AppThemeColor];
    
    NSDictionary *attributesTitle = [NSDictionary dictionaryWithObjectsAndKeys:
                                     AppThemeColor,NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19],NSFontAttributeName,nil];
    [[UINavigationBar appearance]setTitleTextAttributes:attributesTitle];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                AppThemeColor,NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName,nil];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes
                                                forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, -1000)
                                                         forBarMetrics:UIBarMetricsDefault];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:AppThemeColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:13],NSFontAttributeName, nil] forState:UIControlStateSelected];
    // set the text color for unselected state
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:13],NSFontAttributeName, nil] forState:UIControlStateNormal];
}



#pragma mark -- 3rd Part setting
@end
