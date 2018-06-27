//
//  YYBeeHive.h
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYBHServiceManager.h"
#import "YYBHContext.h"
@interface YYBeeHive : NSObject

@property(nonatomic, strong) YYBHContext *context;
+ (instancetype)shareInstance;

+ (void)registerDynamicModule:(Class) moduleClass;

- (id)createService:(Protocol *)proto;


@end
