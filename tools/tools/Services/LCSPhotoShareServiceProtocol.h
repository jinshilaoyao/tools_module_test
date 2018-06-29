//
//  LCSPhotoShareServiceProtocl.h
//  tools
//
//  Created by yaoyao on 2018/6/29.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHServiceProtocol.h"

typedef enum : NSUInteger {
    PhotoShareType_A,
    PhotoShareType_B,
    PhotoShareType_C
} PhotoShareType;

typedef enum : NSUInteger {
    PhotoShareChannel_unknow,
    PhotoShareChannel_WX,
    PhotoShareChannel_WB,
} PhotoShareChannel;

@protocol LCSPhotoShareServiceProtocol <BHServiceProtocol>
- (UIViewController *)mainViewController;
- (void)photoShareWithType:(PhotoShareType)type andChannel:(PhotoShareChannel)channel;
@end
