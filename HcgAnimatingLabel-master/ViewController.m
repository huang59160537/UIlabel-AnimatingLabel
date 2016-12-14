//
//  ViewController.m
//  HcgAnimatingLabel-master
//
//  Created by 黄成钢 on 07/12/2016.
//  Copyright © 2016 chedaoshanqian. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Animating.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:label];
    [label animateToValue:50 formatter:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
