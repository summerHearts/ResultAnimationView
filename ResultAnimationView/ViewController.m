//
//  ViewController.m
//  ResultAnimationView
//
//  Created by Kenvin on 17/1/22.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "ResultAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ResultAnimationView *resultAnimationView = [[ResultAnimationView alloc]initWithFrame:CGRectMake(0, 0, 50,50)];
    resultAnimationView.center=CGPointMake(self.view.center.x,self.view.center.y);
    [self.view addSubview:resultAnimationView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
