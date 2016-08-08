//
//  BezierViewControler.m
//  UIBezierAndGcaphics
//
//  Created by 三个爸爸 on 16/8/5.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "BezierViewControler.h"
#import "BezierView.h"
@interface BezierViewControler ()

@end

@implementation BezierViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BezierView * view = [[BezierView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
