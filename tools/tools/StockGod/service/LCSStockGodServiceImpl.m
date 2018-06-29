
//
//  LCSStockGodServiceImpl.m
//  tools
//
//  Created by yaoyao on 2018/6/29.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "LCSStockGodServiceImpl.h"
#import "StockGodViewController.h"
@interface LCSStockGodServiceImpl()<LCSStockGodServiceProtocol>

@end
@implementation LCSStockGodServiceImpl
- (UIViewController *)mainViewController {
    return [[StockGodViewController alloc] init];
}
@end
