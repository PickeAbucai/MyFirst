//
//  AddView.m
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import "AddView.h"

@implementation AddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (void)drawRect:(CGRect)rect{
    CGSize size = rect.size;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(context, 0, 100);
    CGContextAddQuadCurveToPoint(context, size.width/2, 0, size.width, 100);
    CGContextAddRect(context, CGRectMake(0, 100, size.width, size.height - 100));
    CGContextDrawPath(context, kCGPathFill);
    
}



@end
