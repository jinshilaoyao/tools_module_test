//
//  StockGodRankViewController.m
//  tools
//
//  Created by yaoyao on 2018/6/28.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

#import "StockGodRankViewController.h"
#import "RouteManager.h"
@interface StockGodRankViewController ()

@end

@implementation StockGodRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"StockGod_Rank";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[RouteManager shareInstance] popToRoot];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
