//
//  ScrollView.h
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PropertyModel;
@interface ScrollView : UIScrollView
@property (nonatomic, strong) UIImageView * headImage;
@property (nonatomic, strong) UIButton * btn;
@property (nonatomic, strong) UILabel * label;

- (instancetype)initWithFrame:(CGRect)frame with:(PropertyModel *)model;


@end
