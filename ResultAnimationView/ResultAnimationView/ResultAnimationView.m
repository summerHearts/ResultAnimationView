//
//  ResultAnimationView.m
//  PayResultAnimation
//
//  Created by Kenvin on 17/12/22.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "ResultAnimationView.h"

static CGFloat const  LineWidthScale  = 1.0;
@implementation ResultAnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setAnimation];
    }
    return self;
}

- (void)setAnimation{
    CGSize size = self.frame.size;
    
    CGFloat radius=(size.height>size.width?size.width:size.height)/2.0;
    
    CGFloat lineW= radius*LineWidthScale/10;
    
    //画圈
    UIBezierPath *circlePath =[UIBezierPath bezierPathWithArcCenter:CGPointMake(radius,radius)
                                                             radius:radius
                                                         startAngle:M_PI*3/2
                                                           endAngle:M_PI*7/2
                                                          clockwise:YES];
    
    circlePath.lineCapStyle  = kCGLineCapRound;
    circlePath.lineJoinStyle = kCGLineCapRound;
    
    //对勾
    UIBezierPath*linePath = [UIBezierPath bezierPath];
    
    [linePath moveToPoint:CGPointMake(radius*0.45,radius*1.0)];
    
    [linePath addLineToPoint:CGPointMake(radius*0.84,radius*1.32)];
    
    [linePath addLineToPoint:CGPointMake(radius*1.48,radius*0.68)];
    
    [circlePath appendPath:linePath];
    
    CAShapeLayer*shapeLyer =[CAShapeLayer layer];
    
    shapeLyer.path=circlePath.CGPath;
    
    shapeLyer.strokeColor = [UIColor colorWithRed:0/255.0
                                            green:194/255.0
                                             blue:79/255.0
                                            alpha:1.0].CGColor;
    
    shapeLyer.fillColor= [[UIColor clearColor] CGColor];
    
    shapeLyer.lineWidth=lineW;
    
    shapeLyer.strokeStart= 0.0;
    
    shapeLyer.strokeEnd= 0.0;
    
    [self.layer
     
     addSublayer:shapeLyer];
    
    //动画
    
    CABasicAnimation*animation =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    if(shapeLyer.strokeEnd== 1.0) {
        
        [animation setFromValue:@1.0];
        [animation setToValue:@0.0];
    }else{
        
        [animation setFromValue:@0.0];
        [animation setToValue:@1.0];
    }
    
    [animation setDuration:1.0];
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.removedOnCompletion=NO;
    [shapeLyer addAnimation:animation forKey:@"animationKey"];
}
@end
