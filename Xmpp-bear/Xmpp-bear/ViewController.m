//
//  ViewController.m
//  Xmpp-bear
//
//  Created by 三个爸爸 on 16/7/28.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"
#import "XMPPStream.h"

@interface ViewController ()<XMPPStreamDelegate>{

    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self connect];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)connect{

    if (self.xmppStream == nil) {
        self.xmppStream = [[XMPPStream alloc]init];
        [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
        
    }
    if (![self.xmppStream isConnected]) {
        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        XMPPJID *jid = [XMPPJID jidWithUser:username domain:@"lizhen" resource:@"Ework"];
        [self.xmppStream setMyJID:jid];
        [self.xmppStream setHostName:@"10.4.125.113"];
        NSError *error = nil;
        if ([self.xmppStream connectWithTimeout:10 error:&error]) {
            NSLog(@"Connect Error: %@", [[error userInfo] description]);
        }
    
    }
    
    NSXMLElement * boby = [NSXMLElement elementWithName:@"body"];
    [boby setStringValue:@"hello"];
    NSXMLElement * message = [NSXMLElement elementWithName:@"message"];
    [message addAttributeWithName:@"type" stringValue:@"chat"];
    [message addAttributeWithName:@"to" stringValue:@"xiaoming@example.com"];
    [message addChild:boby];
    [self.xmppStream sendElement:message];
    
}

- (void)xmppStreamWillConnect:(XMPPStream *)sender{

    NSLog(@"WillConnect");
    
}

-(void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket{

    NSLog(@"DidConnect");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
