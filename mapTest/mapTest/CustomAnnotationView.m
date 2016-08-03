//
//  CustomAnnotationView.m
//  mapTest
//
//  Created by 三个爸爸 on 16/8/3.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "CustomAnnotationView.h"

@interface CustomAnnotationView ()

@property (nonatomic,strong,readwrite) CustomCalloutView * calloutView;

@end

@implementation CustomAnnotationView

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{

    if (self.selected == selected) {
        return ;
    }
    
    if (selected) {
        if (self.calloutView == nil) {
            self.calloutView = [[CustomCalloutView alloc]initWithFrame:CGRectMake(0, 0, 180, 70)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,-CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        
        self.calloutView.image = [UIImage imageNamed:@"female.png"];//但是这个图片就死了啊，只能写死在这里就不行啊？
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        [self addSubview:self.calloutView];
    }
    else{
        [self.calloutView removeFromSuperview];
    }
    [super setSelected:selected animated:animated];
    
}


@end
