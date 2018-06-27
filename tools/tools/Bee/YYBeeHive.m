//
//  YYBeeHive.m
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "YYBeeHive.h"
#import "YYBHModuleManager.h"
@implementation YYBeeHive
+ (instancetype)shareInstance {
    static dispatch_once_t p;
    static id BHInstance = nil;
    
    dispatch_once(&p, ^{
        BHInstance = [[self alloc] init];
    });
    
    return BHInstance;
}

- (id)createService:(Protocol *)proto {
    return [[YYBHServiceManager sharedManager] createService:proto];
}

- (void)setContext:(YYBHContext *)context {
    _context = context;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadStaticServices];
//        [self loadStaticModules];
    });
}

-(void)loadStaticServices
{
//    [BHServiceManager sharedManager].enableException = self.enableException;
    
    [[YYBHServiceManager sharedManager] registerLocalServices];
    
}

+ (void)registerDynamicModule:(Class) moduleClass {
    [[YYBHModuleManager sharedManager] registerDynamicModule:moduleClass];
}

@end
