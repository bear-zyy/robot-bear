//
//  ColorModel.h
//  SignName
//
//  Created by 三个爸爸 on 16/7/27.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorModel : NSObject

@property (nonatomic,strong) UIColor * color;

@property (nonatomic,assign) CGFloat value;

+(instancetype)standard;

@end
