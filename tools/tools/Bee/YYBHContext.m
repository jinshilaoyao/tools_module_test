//
//  YYBHContext.m
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "YYBHContext.h"

@interface YYBHContext()

@property(nonatomic, strong) NSMutableDictionary *modulesByName;

@property(nonatomic, strong) NSMutableDictionary *servicesByName;

@end

@implementation YYBHContext

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modulesByName  = [[NSMutableDictionary alloc] initWithCapacity:1];
        self.servicesByName  = [[NSMutableDictionary alloc] initWithCapacity:1];
        self.moduleConfigName = @"BeeHive.bundle/BeeHive";
        self.serviceConfigName = @"YYBHService";
    }
    return self;
}

+ (instancetype)shareInstance
{
    static dispatch_once_t p;
    static id BHInstance = nil;
    
    dispatch_once(&p, ^{
        BHInstance = [[[self class] alloc] init];
//        if ([BHInstance isKindOfClass:[BHContext class]]) {
//            ((BHContext *) BHInstance).config = [BHConfig shareInstance];
//        }
    });
    
    return BHInstance;
}

- (id)getServiceInstanceFromServiceName:(NSString *)serviceName
{
    return [[YYBHContext shareInstance].servicesByName objectForKey:serviceName];
}

- (void)addServiceWithImplInstance:(id)implInstance serviceName:(NSString *)serviceName {
    [[YYBHContext shareInstance].servicesByName setObject:implInstance forKey:serviceName];
}

@end
