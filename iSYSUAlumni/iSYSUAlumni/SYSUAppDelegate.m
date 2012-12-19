//
//  SYSUAppDelegate.m
//  iSYSUAlumni
//
//  Created by again on 12/19/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUAppDelegate.h"
#import "MFSideMenu.h"
#import "SYSUSideMenuViewController.h"
#import "SYSUNewsViewController.h"

@implementation SYSUAppDelegate


- (SYSUNewsViewController *)demoController {
    return [[SYSUNewsViewController alloc] init];
}

- (UINavigationController *)navigationController {
    return [[UINavigationController alloc]
            initWithRootViewController:[self demoController]];
}

- (MFSideMenu *)sideMenu {
    SYSUSideMenuViewController *sideMenuController = [[SYSUSideMenuViewController alloc] init];
    UINavigationController *navigationController = [self navigationController];
    
    MFSideMenuOptions options = MFSideMenuOptionMenuButtonEnabled|MFSideMenuOptionBackButtonEnabled
    |MFSideMenuOptionShadowEnabled;
    MFSideMenuPanMode panMode = MFSideMenuPanModeNavigationBar|MFSideMenuPanModeNavigationController;
    
    MFSideMenu *sideMenu = [MFSideMenu menuWithNavigationController:navigationController
                                                 sideMenuController:sideMenuController
                                                           location:MFSideMenuLocationLeft
                                                            options:options
                                                            panMode:panMode];
    
    sideMenuController.sideMenu = sideMenu;
    
    return sideMenu;
}

-(MFSideMenu *)FriendsMenu {
    SYSUSideMenuViewController *sideMenuController = [[SYSUSideMenuViewController alloc] init];
    UINavigationController *navigationController = [self navigationController];
    
    MFSideMenuOptions options = MFSideMenuOptionMenuButtonEnabled|MFSideMenuOptionBackButtonEnabled
    |MFSideMenuOptionShadowEnabled;
    MFSideMenuPanMode panMode = MFSideMenuPanModeNavigationBar|MFSideMenuPanModeNavigationController;
    
    MFSideMenu *sideMenu = [MFSideMenu menuWithNavigationController:navigationController
                                                 sideMenuController:sideMenuController
                                                           location:MFSideMenuLocationRight
                                                            options:options
                                                            panMode:panMode];
    
    sideMenuController.sideMenu = sideMenu;
    
    return sideMenu;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self sideMenu].navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
