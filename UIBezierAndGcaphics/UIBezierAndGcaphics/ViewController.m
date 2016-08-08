//
//  ViewController.m
//  UIBezierAndGcaphics
//
//  Created by 三个爸爸 on 16/8/5.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"
#import "BezierViewControler.h"
#import "GcaphicsViewControler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * array = @[@"Bezier",@"Gcaphics"];
    
    for (int i=0; i<array.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, i*100+100, 100, 60);
        button.tag = i+1;
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx

-(void)click:(UIButton*)but{

    
    
    if (but.tag== 1) {
        BezierViewControler * view = [[BezierViewControler alloc]init];
        
        [self presentViewController:view animated:YES completion:nil];
        
    }
    else if (but.tag==2){
        GcaphicsViewControler * view = [[GcaphicsViewControler alloc]init];
        
        [self presentViewController:view animated:YES completion:nil];
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
