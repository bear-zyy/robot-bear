//
//  ViewController.m
//  Bounds-Right-Left
//
//  Created by 三个爸爸 on 16/7/22.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

    CGFloat time ;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    CGPoint center = CGPointMake(frame.origin.x + frame.size.width/2 , frame.origin.y +frame.size.height/2 );
    
    UIImageView * imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bgx.png"]];
    
    imageV.frame = CGRectMake(0, 0, 200, 200);
    
    imageV.center = center;
    
    imageV.tag = 10;
    
    [self.view addSubview:imageV];
    
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    
    time = duration;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)deviceOrientationDidChange{
    
//    NSNumber * num = noti.object;
//
//    int time = [num intValue];
    
    UIImageView * imageV = (UIImageView*)[self.view viewWithTag:10];
    
        if ([UIDevice currentDevice].orientation == UIInterfaceOrientationLandscapeLeft) {
    
            
            
            [UIView animateWithDuration:time animations:^{
                
                imageV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                
                imageV.center = self.view.center;
                
            }];
    
        } else if ([UIDevice currentDevice].orientation == UIInterfaceOrientationLandscapeRight) {
    
            [UIView animateWithDuration:time animations:^{
                
                imageV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                
                imageV.center = self.view.center;
                
            }];
    
        } else if ([UIDevice currentDevice].orientation == UIInterfaceOrientationPortraitUpsideDown) {
    
//            [UIView animateWithDuration:time animations:^{
//                
//                imageV.frame = CGRectMake(0, 0, 200, 200);
//                
//                imageV.center = self.view.center;
//                
//            }];
    
        } else {
    
            [UIView animateWithDuration:time animations:^{
                
                imageV.frame = CGRectMake(0, 0, 200,200);
                
                imageV.center = self.view.center;
                
            }];
            
        }
    
    
}



-(BOOL)prefersStatusBarHidden{

    return NO;
}

-(BOOL)shouldAutorotate{

    return YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
