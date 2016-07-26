//
//  ViewController.m
//  3DTouch
//
//  Created by 三个爸爸 on 16/7/26.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"one" localizedTitle:@"哈哈哈哈" localizedSubtitle:@"小宝宝" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    
    UIApplicationShortcutItem * item1 = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"爱你一万年" localizedSubtitle:@"刘欣欣" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    
    UIApplicationShortcutItem * item2 = [[UIApplicationShortcutItem alloc]initWithType:@"thrie" localizedTitle:@"爱你经得起考验" localizedSubtitle:@"张源远" icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@""] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item,item1,item2];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
