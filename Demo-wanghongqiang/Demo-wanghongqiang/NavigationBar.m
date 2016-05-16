//
//  NavigationBar.m
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar{
    CGSize _previousSize;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width;
    CGFloat height = 64;
    self.frame = CGRectMake(0, 0,rect.size.width, 64);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextAddRect(context, CGRectMake(0, 0, width, height));
    CGContextDrawPath(context, kCGPathFill);
}



//- (CGSize)sizeThatFits:(CGSize)size {
//    size = [super sizeThatFits:size];
//    if ([UIApplication sharedApplication].statusBarHidden) {
//        size.height = 64;
//    }
//    return size;
//}



@end
