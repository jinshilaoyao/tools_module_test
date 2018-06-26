//
//  YYBHServiceManager.m
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "YYBHServiceManager.h"
#import "YYBHContext.h"
#import "YYBHServiceProtocol.h"
@interface YYBHServiceManager()
@property (nonatomic, strong) NSMutableDictionary *allServicesDict;
@end
@implementation YYBHServiceManager
+ (instancetype)sharedManager
{
    static id sharedManager = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id)createService:(Protocol *)service {
    
    id implInstance = nil;
    
    NSString *serviceStr = NSStringFromProtocol(service);
    id protocolImpl = [[YYBHContext shareInstance] getServiceInstanceFromServiceName:serviceStr];
    if (protocolImpl) {
        return protocolImpl;
    }
    
    Class implClass = [self serviceImplClass:service];
    if ([[implClass class] respondsToSelector:@selector(singleton)]) {
        if ([[implClass class] singleton]) {
            if ([[implClass class] respondsToSelector:@selector(shareInstance)])
                implInstance = [[implClass class] shareInstance];
            else
                implInstance = [[implClass alloc] init];
            
            [[YYBHContext shareInstance] addServiceWithImplInstance:implInstance serviceName:serviceStr];
            return implInstance;
        }
    }
    
    return [[implClass alloc] init];
}

- (Class)serviceImplClass:(Protocol *)service
{
    NSString *serviceImpl = [self.allServicesDict objectForKey:NSStringFromProtocol(service)];
    if (serviceImpl.length > 0) {
        return NSClassFromString(serviceImpl);
    }
    return nil;
}

- (void)registerLocalServices
{
    NSString *serviceConfigName = [YYBHContext shareInstance].serviceConfigName;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:serviceConfigName ofType:@"plist"];
    if (!plistPath) {
        return;
    }
    
    NSArray *serviceList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
//    [self.lock lock];
    for (NSDictionary *dict in serviceList) {
        NSString *protocolKey = [dict objectForKey:@"service"];
        NSString *protocolImplClass = [dict objectForKey:@"impl"];
        if (protocolKey.length > 0 && protocolImplClass.length > 0) {
            [self.allServicesDict addEntriesFromDictionary:@{protocolKey:protocolImplClass}];
        }
    }
//    [self.lock unlock];
}
- (NSMutableDictionary *)allServicesDict
{
    if (!_allServicesDict) {
        _allServicesDict = [NSMutableDictionary dictionary];
    }
    return _allServicesDict;
}

@end
