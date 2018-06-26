//
//  AppUISkeletonServiceProtocol.h
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//
//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BHServiceProtocol.h"
@protocol AppUISkeletonServiceProtocol <BHServiceProtocol>
- (UIViewController *)mainViewController;
@end
