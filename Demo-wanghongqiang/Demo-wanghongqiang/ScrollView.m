//
//  ScrollView.m
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import "ScrollView.h"
#import "AddView.h"
#import "PropertyModel.h"

@interface ScrollView ()
@property (nonatomic, strong) PropertyModel * model;

@end

@implementation ScrollView

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
//        _headImage.backgroundColor = [UIColor lightGrayColor];
    }
    return _headImage;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.layer.cornerRadius = 4.0;
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor greenColor];
    }
    return _btn;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15.0];
    }
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame with:(PropertyModel *)model{
    self = [super initWithFrame:frame];
    if (self) {
        self.model= model;
        
        CGRect afrmae = CGRectMake(0, 100, frame.size.width, 1000);
        AddView * add = [[AddView alloc] initWithFrame:afrmae];
        add.backgroundColor = [UIColor clearColor];
        
        
        CGPoint center = self.center;
        self.btn.frame = CGRectMake(0, 0, 150, 30);
        self.btn.center = CGPointMake(center.x, 150);
        [self.btn setTitle:@"加入班级" forState:UIControlStateNormal];
        
        self.label.frame = CGRectMake(0, 0, 200, 30);
        self.label.center = CGPointMake(center.x, 120);
        self.label.text = @"您还没有申请班级";
        
        [add addSubview:_btn];
        [add addSubview:_label];
        
        [self addSubview:add];
        [self addSubview:self.headImage];
    }
    return self;
}

- (void)layoutSubviews {
    self.headImage.frame = self.model.headImageFrame;
    self.headImage.center = CGPointMake(self.center.x, 150);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
