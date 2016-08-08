//
//  BezierView.m
//  UIBezierAndGcaphics
//
//  Created by 三个爸爸 on 16/8/5.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        //设置背景色
        //        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (!self) {

        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80, 80) radius:40 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    path.lineWidth = 6.0;
    
    [path stroke];
    
    UIBezierPath * path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:40 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    path1.lineWidth = 6.0;
    
    [path1 stroke];
    
//    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
//    
//    layer.path = path.CGPath;
//    
//    self.layer.mask = layer;
//    
//    CABasicAnimation * transformAnima = [[CABasicAnimation alloc]init];
//    
//    transformAnima.duration = 3;
//    
////    transformAnima.repeatCount = 3;
//    
//    transformAnima.delegate = self;
//    
//    transformAnima.removedOnCompletion = NO;
//    
//    transformAnima.fillMode = kCAFillModeForwards;
//    
//    transformAnima.fromValue = (__bridge id _Nullable)(path.CGPath);
//    
//    transformAnima.toValue = (__bridge id _Nullable)(path1.CGPath);
//    
////    transformAnima.toValue = [NSValue valueWithCGRect:CGRectMake(200, 200, 100, 100)];
//    
//    [layer addAnimation:transformAnima forKey:@"path"];
    
    
    UIBezierPath * path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 400, 50, 100)];
    
    path2.lineCapStyle = kCGLineCapRound;
    
    path2.lineJoinStyle = kCGLineCapRound;
    
    UIColor * color = [UIColor redColor];
    
    [color set];
    
    path2.lineWidth = 5.0;
    
    [path2 stroke];
    
    
    UIBezierPath * path3 = [UIBezierPath bezierPathWithRect:CGRectMake(100, 500, 50, 50)];
    
    path3.lineWidth = 6.0;
    
    [path3 stroke];
    
    UIBezierPath * path4 = [UIBezierPath bezierPath];
    
    path4.lineWidth = 10;
    
    [path4 moveToPoint:CGPointMake(200, 400)];
    
    
    [path4 addLineToPoint:CGPointMake(200, 500)];
    
    [path4 addLineToPoint:CGPointMake(300, 500)];
    
    [path4 closePath];
    
    [path4 fill];
    
    [path4 stroke];
    
    UIBezierPath * path5 =[UIBezierPath bezierPath];
    
    path5.lineWidth = 5.0;
    
    [path5 moveToPoint:CGPointMake(100, 200)];
    
    [path5 addQuadCurveToPoint:CGPointMake(0, 300) controlPoint:CGPointMake(50, 250)];

    [path5 stroke];
    
    UIBezierPath * path6 = [UIBezierPath bezierPath];
    
    [path6 moveToPoint:CGPointMake(200, 300)];
    
    [path6 addLineToPoint:CGPointMake(200, 350)];
    
    [path6 addLineToPoint:CGPointMake(200, 350)];
    
    [path6 addLineToPoint:CGPointMake(300, 400)];
    
    [path6 addLineToPoint:CGPointMake(350, 200)];
    
    [path6 closePath];
    
    [path6 fill];
    
    [path6 stroke];
    
    
    
}

@end
