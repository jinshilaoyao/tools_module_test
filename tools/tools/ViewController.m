//
//  ViewController.m
//  tools
//
//  Created by yaoyao on 2018/6/22.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "ViewController.h"
#import "RouteManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchA {
//    id<AppUISkeletonServiceProtocol> skeletonService = [[YYBeeHive shareInstance] createService:@protocol(AppUISkeletonServiceProtocol)];
//    UIViewController * mainViewController = [skeletonService mainViewController];
//    [self.navigationController pushViewController:mainViewController animated:YES];
    
    [MGJRouter openURL:kRoutePageHome];
    
}
- (IBAction)touchB {
//    [self.navigationController pushViewController:[BViewController new] animated:YES];
}

- (IBAction)touchC {
//    [self.navigationController pushViewController:[CViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
