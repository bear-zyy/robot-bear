//
//  ColorModel.m
//  SignName
//
//  Created by 三个爸爸 on 16/7/27.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ColorModel.h"

@implementation ColorModel

+(instancetype)standard{
    
   static ColorModel * model;

    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        
       model  = [[ColorModel alloc]init];
       
        model.value = 2.0;
        model.color = [UIColor blackColor];
        
    });
    
    return model;
}

@end
