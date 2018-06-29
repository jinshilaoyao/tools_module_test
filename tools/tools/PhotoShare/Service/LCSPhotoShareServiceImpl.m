//
//  LCSPhotoShareServiceImpl.m
//  tools
//
//  Created by yaoyao on 2018/6/29.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "LCSPhotoShareServiceImpl.h"
#import "LCSPhotoShareServiceProtocol.h"
#import "PhotoShareViewController.h"
@interface LCSPhotoShareServiceImpl()<LCSPhotoShareServiceProtocol>


@end

@implementation LCSPhotoShareServiceImpl

+ (BOOL)singleton {
    return YES;
}

- (UIViewController *)mainViewController {
    return [PhotoShareViewController new];
}

- (void)photoShareWithType:(PhotoShareType)type andChannel:(PhotoShareChannel)channel {
    
}

@end
