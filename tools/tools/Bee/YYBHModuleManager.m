//
//  YYBHModuleManager.m
//  tools
//
//  Created by yaoyao on 2018/6/27.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "YYBHModuleManager.h"
#import "YYBHModuleProtocol.h"
#import "YYBHContext.h"

#define kModuleArrayKey     @"moduleClasses"
#define kModuleInfoNameKey  @"moduleClass"
#define kModuleInfoLevelKey @"moduleLevel"

static  NSString *kSetupSelector = @"modSetUp:";
static  NSString *kInitSelector = @"modInit:";
static  NSString *kDidRegisterForRemoteNotificationsSelector = @"modDidRegisterForRemoteNotifications:";
static  NSString *kDidEnterBackgroundSelector = @"modDidEnterBackground:";
static  NSString *kWillEnterForegroundSelector = @"modWillEnterForeground:";
@interface YYBHModuleManager()
@property(nonatomic, strong) NSMutableArray     *BHModuleDynamicClasses;

@property(nonatomic, strong)  NSMutableArray      *BHModules;
@end

@implementation YYBHModuleManager
+ (instancetype)sharedManager {
    static id sharedManager = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedManager = [[YYBHModuleManager alloc] init];
    });
    return sharedManager;
}

- (NSMutableArray *)BHModules
{
    if (!_BHModules) {
        _BHModules = [NSMutableArray array];
    }
    return _BHModules;
}

// If you do not comply with set Level protocol, the default Normal
- (void)registerDynamicModule:(Class)moduleClass {
    [self addModuleFormObject:moduleClass];
}

- (void)addModuleFormObject:(id)object {
    
    Class class;
    NSString *moduleName = nil;
    
    if (object) {
        class = object;
        moduleName = NSStringFromClass(class);
    } else {
        return ;
    }
    
    if ([class conformsToProtocol:@protocol(YYBHModuleProtocol)]) {
        NSMutableDictionary * moduleInfo = [NSMutableDictionary dictionary];
        
        BOOL responseBasicLevel = [class instancesRespondToSelector:@selector(basicModuleLevel)];
        
        int levelInt = 1;
        
        if (responseBasicLevel) {
            levelInt = 0;
        }
        
        [moduleInfo setObject:@(levelInt) forKey:kModuleInfoLevelKey];
        if (moduleName) {
            [moduleInfo setObject:moduleName forKey:kModuleInfoNameKey];
        }
        
        [self.BHModules addObject:moduleInfo];
        
    }
}

//
//- (void)loadLocalModules;
//
- (void)registedAllModules {
    NSMutableArray *tmpArray = [NSMutableArray array];
    [self.BHModules enumerateObjectsUsingBlock:^(NSDictionary * module, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * classStr = [module objectForKey:kModuleInfoNameKey];
        
        Class moduleClass = NSClassFromString(classStr);
        
        if (NSStringFromClass(moduleClass)) {
            id<YYBHModuleProtocol> moduleInstance = [[moduleClass alloc] init];
            [tmpArray addObject:moduleInstance];
        }
    }];
    
    [self.BHModules removeAllObjects];
    [self.BHModules addObjectsFromArray:tmpArray];
}

- (void)triggerEvent:(YYBHModuleEventType)eventType {
    switch (eventType) {
        case YYBHMSetupEvent:
            [self handleModuleEvent:kSetupSelector];
            break;
        case YYBHMInitEvent:
            [self handleModulesInitEvent];
            break;
        case YYBHMDidReceiveLocalNotificationEvent:
            [self handleModuleEvent:kDidRegisterForRemoteNotificationsSelector];
            break;
        case YYBHMDidEnterBackgroundEvent:
            [self handleModuleEvent:kDidEnterBackgroundSelector];
            break;
        case YYBHMWillEnterForegroundEvent:
            [self handleModuleEvent:kWillEnterForegroundSelector];
            break;
    }
}
- (void)handleModuleEvent:(NSString *)selectorStr {
    SEL seletor = NSSelectorFromString(selectorStr);
    
    [self.BHModules enumerateObjectsUsingBlock:^(id<YYBHModuleProtocol> moduleInstance, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([moduleInstance respondsToSelector:seletor]) {
            [moduleInstance performSelector:seletor withObject:[YYBHContext shareInstance]];
        }
    }];
}
- (void)handleModulesInitEvent {
    [self.BHModules enumerateObjectsUsingBlock:^(id<YYBHModuleProtocol> moduleInstance, NSUInteger idx, BOOL * _Nonnull stop) {
        __weak typeof(&*self) wself = self;
        void (^bk)(void);
        bk = ^(){
            __strong typeof(&*self) sself = wself;
            if (sself) {
                if ([moduleInstance respondsToSelector:@selector(modInit:)]) {
                    [moduleInstance modInit:[YYBHContext shareInstance]];
                }
            }
        };
        
        if ([moduleInstance respondsToSelector:@selector(async)]) {
            BOOL asyc = [moduleInstance async];
            
            if (asyc) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    bk();
                });
            } else {
                bk();
            }
        } else {
            bk();
        }
    }];
}
@end
