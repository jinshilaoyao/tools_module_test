//
//  RouteManager+PhotoShare.m
//  tools
//
//  Created by yao yao on 2018/7/1.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "RouteManager+PhotoShare.h"
#import "LCSPhotoShareServiceProtocol.h"
@implementation RouteManager (PhotoShare)
- (void)registerRouteForPhotoShare {
    [MGJRouter registerURLPattern:kRoutePhotoShare toHandler:^(NSDictionary *routerParameters) {
        
        NSLog(@"%@",routerParameters);
        
            id<LCSPhotoShareServiceProtocol> shareService = [[YYBeeHive shareInstance] createService:@protocol(LCSPhotoShareServiceProtocol)];
            [shareService photoShareWithType:(PhotoShareType_A) andChannel:(PhotoShareChannel_WB)];
        
    }];
}
@end
