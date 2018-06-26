//
//  RouteManager.m
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "RouteManager.h"

@implementation RouteManager
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static RouteManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[RouteManager alloc] init];
    });
    return manager;
}

- (void)popToRoot {
    [self.rootViewController popToRootViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController {
    [self.rootViewController pushViewController:viewController animated:YES];
}

// for demo only
- (UINavigationController *)rootViewController {
   return (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
}

- (void)tryToOpenURL:(NSURL *)url {
    if (![url.scheme isEqualToString:@"ms"]) {
        return;
    }
//    [MGJRouter openURL:[url absoluteString]];
}

@end
