//
//  YYBHModuleProtocol.h
//  tools
//
//  Created by yaoyao on 2018/6/26.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

@class YYBHContext;
@protocol YYBHModuleProtocol <NSObject>

@optional

//如果不去设置Level默认是Normal
//basicModuleLevel不去实现默认Normal
- (void)basicModuleLevel;

- (BOOL)async;

- (void)modSetUp:(YYBHContext *)context;

- (void)modInit:(YYBHContext *)context;


@end


