//
//  CustomAnnotationView.h
//  mapTest
//
//  Created by 三个爸爸 on 16/8/3.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomCalloutView.h"

@interface CustomAnnotationView : MAAnnotationView

@property (nonatomic,readonly) CustomCalloutView * calloutView;

@end
