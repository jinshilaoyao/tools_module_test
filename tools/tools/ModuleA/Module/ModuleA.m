
//
//  ModuleA.m
//  tools
//
//  Created by yaoyao on 2018/6/27.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "ModuleA.h"
#import "YYBHModuleProtocol.h"
#import "RouteManager+ModuleA.h"
#import "YYBeeHive.h"
@interface ModuleA()<YYBHModuleProtocol>

@end

@implementation ModuleA

+ (void)load {
    [YYBeeHive registerDynamicModule:[self class]];
}

- (void)modSetUp:(YYBHContext *)context {
    [[RouteManager shareInstance] registerRouteForModuleA];
}

- (void)modInit:(YYBHContext *)context {
    
}

@end
