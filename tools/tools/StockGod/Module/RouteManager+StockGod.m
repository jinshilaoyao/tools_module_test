//
//  RouteManager+StockGod.m
//  tools
//
//  Created by yaoyao on 2018/6/28.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "RouteManager+StockGod.h"
#import "StockGodViewController.h"
#import "StockGodRankViewController.h"
@implementation RouteManager (StockGod)
- (void)registerRouteForStockGod {
    [MGJRouter registerURLPattern:kRoutePageStockGod toHandler:^(NSDictionary *routerParameters) {
        [self pushViewController:[StockGodViewController new]];
    }];
    
    
    [MGJRouter registerURLPattern:kRoutePageStockGodRank toHandler:^(NSDictionary *routerParameters) {
        [self pushViewController:[[StockGodRankViewController alloc] init]];
    }];
    
}
@end
