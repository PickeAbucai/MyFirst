//
//  RefreshView.m
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImageView *)arrowImageView{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
    }
    return _arrowImageView;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
    }
    return _dateLabel;
}

- (UILabel *)alertLabel{
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc] init];
    }
    return _alertLabel;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        self.dateLabel.text = @"最后更新日期";
        self.alertLabel.text = @"下拉可以刷新";
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        self.alertLabel.textAlignment = NSTextAlignmentCenter;
        self.arrowImageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.arrowImageView];
        [self addSubview:self.dateLabel];
        [self addSubview:self.alertLabel];
    }
    return self;
}

- (void)layoutSubviews{
    CGFloat width = self.frame.size.width;
    self.alertLabel.frame = CGRectMake(0, 10, width, 20);
    self.dateLabel.frame = CGRectMake(0, 30, width, 20);
//    self.arrowImageView.frame = CGRectMake(0, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
}








@end
