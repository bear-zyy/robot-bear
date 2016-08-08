//
//  ViewController.m
//  JavaScriptTest
//
//  Created by 三个爸爸 on 16/8/5.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    NSURL * url = [NSURL URLWithString:string];
//    
    web.delegate = self;
//
//    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
//    
//    [web loadRequest:request];

    NSString * path = [[NSBundle mainBundle] bundlePath];
    
    NSURL * url = [NSURL fileURLWithPath:path];
    
    NSString * htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSString * htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:(NSUTF8StringEncoding) error:nil];
    
    [web loadHTMLString:htmlString baseURL:url];
    
    [self.view addSubview:web];
    
//        UIButton * control = [UIButton buttonWithType:UIButtonTypeCustom];
//        control.frame = CGRectMake(280, 500, 50, 40);
//        [control setTitle:@"消失" forState:UIControlStateNormal];
//        [control setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [control addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:control];


    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    
    
    NSString * string1 = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    
    NSLog(@"++++++++%@-----%@",currentURL,string1);
    

    
}

#pragma mark 其实这里点击Javascript，就是然他发一个请求消息，在iOS中截获这个消息的URL，就是一次交互
//会发请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL * url = [request URL];
    
    if ([[url scheme] isEqualToString:@"youdao"]) {
        UIImageView * imageV = [[UIImageView alloc]init];
        imageV.image = [UIImage imageNamed:@"295Profile.png"];
        imageV.alpha = 0.7;
        imageV.tag = 10;
        imageV.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:imageV];
        
        [UIView animateWithDuration:0.5 animations:^{
            imageV.alpha = 1.0;
            imageV.frame = CGRectMake(50, 50, 200, 200);
            
            UIButton * control = [UIButton buttonWithType:UIButtonTypeCustom];
            control.frame = CGRectMake(50, 50, 200, 200);
//            [control setTitle:@"消失" forState:UIControlStateNormal];
            [control setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [control addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:control];
            
        }];
    }
    return YES;
}

-(void)click:(UIButton *) cont{

    UIImageView * imageV = (UIImageView *)[self.view viewWithTag:10];
    
    [imageV removeFromSuperview];
//    
    [cont removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
