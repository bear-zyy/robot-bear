//
//  SignView.m
//  SignName
//
//  Created by 三个爸爸 on 16/7/26.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "SignView.h"
#import "SignModel.h"
@implementation SignView{

    NSMutableArray * stepArray;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {

        self.backgroundColor =[UIColor  grayColor];
        
        stepArray = [NSMutableArray array];
        
    
    }
    
    return self;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    SignModel * model = [[SignModel alloc]init];
    
    model.clo = [UIColor redColor];
    
    model.value = 2.0;
    
    model.paths = [NSMutableArray array];
    
    [stepArray addObject:model];
    
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    SignModel * model = [stepArray lastObject];
    
    CGPoint movePoint = [[touches anyObject] locationInView:self];
    
    NSLog(@"  x:%f   y:%f",movePoint.x,movePoint.y);
    
    
    
    [model.paths addObject:[NSValue valueWithCGPoint:movePoint]];
    
    
    //通知重新渲染界面，这个方法会重新调用UIView的drawRect:(CGRect)rect方法
    [self setNeedsDisplay];
    
}

-(void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (int i=0; i<stepArray.count; i++) {
        SignModel * model = stepArray[i];
        NSMutableArray * pathA = model.paths;
        
        CGMutablePathRef path = CGPathCreateMutable();
        
        for (int j=0; j<pathA.count; j++) {
            CGPoint point = [[pathA objectAtIndex:j] CGPointValue];
            
            if (j==0) {
                CGPathMoveToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
            else{
                CGPathAddLineToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
            
        }
        
        CGContextSetStrokeColorWithColor(ctx, model.clo.CGColor);
        
        CGContextSetLineWidth(ctx, model.value);
        
        CGContextAddPath(ctx, path);
        
        CGContextStrokePath(ctx);
        
    }
    
    

}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


}


@end
