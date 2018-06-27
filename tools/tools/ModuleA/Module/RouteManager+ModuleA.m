//
//  RouteManager+ModuleA.m
//  tools
//
//  Created by yaoyao on 2018/6/27.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "RouteManager+ModuleA.h"
#import "HomeViewController.h"
@implementation RouteManager (ModuleA)
- (void)registerRouteForModuleA {
    [MGJRouter registerURLPattern:kRoutePageHome toHandler:^(NSDictionary *routerParameters) {
        
        [self pushViewController:[HomeViewController new]];
        
    }];
}
@end
