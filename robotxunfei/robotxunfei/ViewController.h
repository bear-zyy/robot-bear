//
//  ViewController.h
//  robotxunfei
//
//  Created by 三个爸爸 on 16/7/20.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iflyMSC/iflyMSC.h"

@class IFlySpeechRecognizer;

@interface ViewController : UIViewController<UIActionSheetDelegate,IFlySpeechRecognizerDelegate,IFlyRecognizerViewDelegate>

@property (nonatomic, strong) NSString *pcmFilePath;//音频文件路径

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;//不带界面的识别对象

@property (nonatomic, strong) IFlyRecognizerView *iflyRecognizerView;//带界面的识别对象

@property (nonatomic, strong) NSString * result;

@property (nonatomic, assign) BOOL isCanceled;

@end

