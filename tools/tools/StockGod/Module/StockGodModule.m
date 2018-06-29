//
//  StockGodModule.m
//  tools
//
//  Created by yaoyao on 2018/6/28.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "StockGodModule.h"
#import "RouteManager+StockGod.h"
#import "YYBeeHive.h"

@interface StockGodModule()<YYBHModuleProtocol>

@end

@implementation StockGodModule

+ (void)load {
    [YYBeeHive registerDynamicModule:[self class]];
}

- (void)modSetUp:(YYBHContext *)context {
    [[RouteManager shareInstance] registerRouteForStockGod];
}

- (void)modInit:(YYBHContext *)context {
    
}

@end
