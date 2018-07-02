//
//  RouteManager.h
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MGJRouter.h"
#import "YYBeeHive.h"
static NSString *const kRoutePageHome = @"ms://home";
static NSString *const kRoutePageB = @"ms://pageB";
static NSString *const kRoutePageB1 = @"ms://pageB1";
static NSString *const kRoutePageStockGod = @"ms://stockGod?stock_id=12345";
static NSString *const kRoutePageStockGodRank = @"ms://stockGodRank";
static NSString *const kRoutePhotoShare = @"ms://photoShare";


@interface RouteManager : NSObject
+ (instancetype)shareInstance;

- (void)popToRoot;
- (void)pushViewController:(UIViewController *)viewController;

- (void)tryToOpenURL:(NSURL *)url;
@end
