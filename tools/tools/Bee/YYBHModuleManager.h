//
//  YYBHModuleManager.h
//  tools
//
//  Created by yaoyao on 2018/6/27.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, YYBHModuleEventType)
{
    YYBHMSetupEvent = 0,
    YYBHMInitEvent,
    YYBHMDidRegisterForRemoteNotificationsEvent,
    YYBHMDidReceiveRemoteNotificationEvent,
    YYBHMDidReceiveLocalNotificationEvent,
    YYBHMDidEnterBackgroundEvent,
    YYBHMWillEnterForegroundEvent
};
@interface YYBHModuleManager : NSObject
+ (instancetype)sharedManager;

// If you do not comply with set Level protocol, the default Normal
- (void)registerDynamicModule:(Class)moduleClass;

- (void)loadLocalModules;

- (void)registedAllModules;

- (void)triggerEvent:(YYBHModuleEventType)eventType;
@end
