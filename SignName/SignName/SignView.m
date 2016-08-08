//
//  SignView.m
//  SignName
//
//  Created by 三个爸爸 on 16/7/26.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "SignView.h"
#import "SignModel.h"
#import "Masonry.h"
#import "ColorModel.h"

@implementation SignView{

    NSMutableArray * stepArray;
    
    UIColor * color;
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
        
        color = [UIColor blackColor];
        
        stepArray = [NSMutableArray array];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reset:) name:@"reset" object:nil];
        
//        UIView * view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor grayColor];
//        [self addSubview:view];
//        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//           
//            make.left.and.right.and.top.mas_equalTo(self);
//            make.height.mas_equalTo(100);
//            
//        }];
        
        
        
    }
    
    return self;

}

-(void)reset:(NSNotification*)noti{

    [stepArray removeAllObjects];
    [self setNeedsDisplay];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint movePoint = [[touches anyObject] locationInView:self];
    
    if (movePoint.y>100) {
        return;
    }
    
    SignModel * model = [[SignModel alloc]init];
    
//    model.clo = color;
    
    ColorModel * mod = [ColorModel standard];
    
    model.clo = mod.color;
    
    model.value = mod.value;
    
    model.paths = [NSMutableArray array];
    
    [stepArray addObject:model];
    
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    SignModel * model = [stepArray lastObject];
    
    CGPoint movePoint = [[touches anyObject] locationInView:self];
    
    NSLog(@"  x:%f   y:%f",movePoint.x,movePoint.y);
    
    [model.paths addObject:[NSValue valueWithCGPoint:movePoint]];
    
//    if (movePoint.y>100) {
//        return;
//    }
    
    
    
    
    
    //通知重新渲染界面，这个方法会重新调用UIView的drawRect:(CGRect)rect方法
    [self setNeedsDisplay];
    
}

#pragma mark 从写drawRect方法
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
