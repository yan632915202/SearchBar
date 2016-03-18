//
//  ViewController.m
//  test
//
//  Created by 12345 on 15/7/22.
//  Copyright (c) 2015年 12345. All rights reserved.
//

#import "ViewController.h"
#import "DY_searchViewController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //进入搜索界面的入口
    UIButton *tempSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tempSearchButton setTitle:@"进入搜索界面" forState:UIControlStateNormal];
    [tempSearchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    tempSearchButton.frame = CGRectMake(0, 0, 200, 60);
    tempSearchButton.center = self.view.center;
    [tempSearchButton addTarget:self action:@selector(enterSearchVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempSearchButton];
    
}


//点击进入搜索界面
- (void)enterSearchVC{
    
    DY_searchViewController *searchVC = [[DY_searchViewController alloc]init];
    [self presentViewController:searchVC animated:YES completion:
    ^{
        
    }];
}

@end
