//
//  StockGodViewController.m
//  tools
//
//  Created by yaoyao on 2018/6/28.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "StockGodViewController.h"
#import "RouteManager.h"
@interface StockGodViewController ()

@end

@implementation StockGodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"StockGod";
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MGJRouter openURL:kRoutePageStockGodRank];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
