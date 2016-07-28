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
#import "ColorModel.h"

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
    
    SignView * sign = [[SignView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 170, 300, 100)];
    
    
    [self.view addSubview:sign];
    
    NSArray * colorArr = @[[UIColor redColor],[UIColor orangeColor],[UIColor blueColor],[UIColor blackColor]];
    
    for (int i=0; i<colorArr.count; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = colorArr[i];
        //            button.frame = CGRectMake(i*(33.3+50), 150, 50, 30);
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(sign.mas_bottom).offset(50);
            make.size.mas_equalTo(CGSizeMake(50, 30));
            
            if (i==1||i==0) {
                make.left.mas_equalTo(sign.mas_left).offset(i*(50+33.3));
            }
            else{
                make.right.mas_equalTo(sign.mas_right).offset((i-3)*(83.3));
            }
        }];
    }
    
    UISlider * slider = [[UISlider alloc]init];
    slider.maximumValue = 10;
    slider.minimumValue = 1;
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sign.mas_left);
        make.right.mas_equalTo(sign.mas_right);
        make.top.mas_equalTo(sign.mas_bottom).offset(10);
    }];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"重置" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(clickReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(sign.mas_bottom).offset(110);
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)slider:(UISlider*)slider{

    ColorModel * model = [ColorModel standard];
    model.value = slider.value;
    
}

-(void)clickReset{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"reset" object:nil];
    
    
}

-(void)click:(UIButton*)but{

    [NSUserDefaults standardUserDefaults];
    
    ColorModel * model = [ColorModel standard];
    
    model.color = but.backgroundColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
