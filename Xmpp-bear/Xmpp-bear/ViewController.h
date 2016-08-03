//
//  ViewController.h
//  Xmpp-bear
//
//  Created by 三个爸爸 on 16/7/28.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "iPhoneXMPPAppDelegate.h"

#import <XMPPFramework.h>



#import <XMPP.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) XMPPStream *xmppStream;

@end

