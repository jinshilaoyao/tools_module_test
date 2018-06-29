//
//  ViewController.m
//  tools
//
//  Created by yaoyao on 2018/6/22.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "ViewController.h"
#import "RouteManager.h"
#import "LCSPhotoShareServiceProtocol.h"
#import "YYBeeHive.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchA {
    [MGJRouter openURL:kRoutePageHome];
}
- (IBAction)touchB {
    UIImage * image = [UIImage imageNamed:@"asefa"];
    NSData * data = [[NSData alloc] init];
    NSDictionary * dict = @{@"model":data};
    [MGJRouter openURL:kRoutePageStockGod withUserInfo:dict completion:^(id result) {
        
    }];
}

- (IBAction)touchC {
    id<LCSPhotoShareServiceProtocol> shareService = [[YYBeeHive shareInstance] createService:@protocol(LCSPhotoShareServiceProtocol)];
    [shareService photoShareWithType:(PhotoShareType_A) andChannel:(PhotoShareChannel_WB)];
}

@end
