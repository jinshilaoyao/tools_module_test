//
//  PhotoShareModule.m
//  tools
//
//  Created by yaoyao on 2018/6/29.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "PhotoShareModule.h"
#import "YYBHModuleProtocol.h"
#import "RouteManager+PhotoShare.h"
#import "YYBeeHive.h"

@interface PhotoShareModule()<YYBHModuleProtocol>


@end

@implementation PhotoShareModule
+ (void)load {
    [YYBeeHive registerDynamicModule:[self class]];
}
- (void)modSetUp:(YYBHContext *)context {
    [[RouteManager shareInstance] registerRouteForPhotoShare];
}
@end
