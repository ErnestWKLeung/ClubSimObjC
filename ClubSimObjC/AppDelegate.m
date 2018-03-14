//
//  AppDelegate.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    // Add this if you only want to change Selected Image color
//    // and/or selected image text
//    UIColor *selectedColor = [UIColor colorWithRed:(255.0/255.0) green:(216.0/255.0) blue:(9.0/255.0) alpha:1.0];
//
//    [[UITabBar appearance] setTintColor: selectedColor];
//
//    // Add this code to change StateNormal text Color,
//    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor lightTextColor]} forState:UIControlStateNormal];
//    
//    // then if StateSelected should be different, you should add this code
//    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : selectedColor} forState:UIControlStateSelected];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
