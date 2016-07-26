//
//  ViewController.m
//  SignName
//
//  Created by 三个爸爸 on 16/7/26.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"
#import "SignView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc]init];
    label.text = @"签名处";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        
    }];
    
//    UIView * view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view);
//        make.top.mas_equalTo(label.mas_bottom).offset(30);
//        make.size.mas_equalTo(CGSizeMake(250, 100));
//    }];
    
    SignView * sign = [[SignView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, 170, 250, 100)];
    
    [self.view addSubview:sign];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
