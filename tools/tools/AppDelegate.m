//
//  AppDelegate.m
//  tools
//
//  Created by yaoyao on 2018/6/22.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "AppDelegate.h"
#import "YYBeeHive.h"
#import "AppUISkeletonServiceProtocol.h"
#import "LCSStockGodServiceProtocol.h"
#import "YYBHModuleManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[YYBeeHive shareInstance] setContext:[YYBHContext shareInstance]];
//    [self setipMainWindow];
    
    [[YYBHModuleManager sharedManager] triggerEvent:YYBHMSetupEvent];
    [[YYBHModuleManager sharedManager] triggerEvent:YYBHMInitEvent];
    
    return YES;
}

- (void)setipMainWindow {
//    id<AppUISkeletonServiceProtocol> skeletonService = [[YYBeeHive shareInstance] createService:@protocol(AppUISkeletonServiceProtocol)];
//    UIViewController * mainViewController = [skeletonService mainViewController];
    
    id<LCSStockGodServiceProtocol> stockGodService = [[YYBeeHive shareInstance] createService:@protocol(LCSStockGodServiceProtocol)];
    UIViewController * mainViewController = [stockGodService mainViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:(UIViewController *)mainViewController];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[YYBHModuleManager sharedManager] triggerEvent:YYBHMDidEnterBackgroundEvent];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[YYBHModuleManager sharedManager] triggerEvent:YYBHMWillEnterForegroundEvent];
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
        [[YYBHModuleManager sharedManager] triggerEvent:YYBHMDidReceiveLocalNotificationEvent];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
