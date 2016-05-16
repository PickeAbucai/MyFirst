//
//  ViewController.m
//  Demo-wanghongqiang
//
//  Created by 强 on 16/5/16.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
#import "PropertyModel.h"

#define HEIGHT_HEADIMAGE 70.f
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) PropertyModel * model;
@property (nonatomic, strong) UIImageView * navHeadImage;
@property (nonatomic, strong) UILabel * titlelabel;

@property (nonatomic, strong) UIScrollView * scroll;
@property (nonatomic, strong) UIImageView * headImage;
@property (nonatomic, strong) UIButton * btn;

@end

@implementation ViewController

- (PropertyModel *)model{
    if (!_model) {
        _model = [[PropertyModel alloc] init];
        _model.headImageFrame = CGRectMake(0, 0, HEIGHT_HEADIMAGE, HEIGHT_HEADIMAGE);
    }
    return _model;
}

- (UIImageView *)navHeadImage {
    if (!_navHeadImage) {
        _navHeadImage = [[UIImageView alloc] init];
        _navHeadImage.frame = CGRectMake(self.view.center.x - HEIGHT_HEADIMAGE/2, 64, HEIGHT_HEADIMAGE/2, HEIGHT_HEADIMAGE/2);
//        _navHeadImage.backgroundColor = [UIColor lightGrayColor];
    }
    return _navHeadImage;
}

-(UILabel *)titlelabel{
    if (!_titlelabel) {
        _titlelabel = [[UILabel alloc] init];
        _titlelabel.font = [UIFont systemFontOfSize:17 weight:2.0];
        _titlelabel.textColor = [UIColor whiteColor];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titlelabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%s", __FUNCTION__);
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSString * str = @"作业";
    CGSize size = [self receiveSizeWith:str];
    self.model.navImageFrame = CGRectMake(self.view.center.x - (size.width/2), 20, [self receiveSizeWith:str].width, 40);
    self.titlelabel.text = str;
    self.titlelabel.frame = self.model.navImageFrame;
    self.navigationItem.titleView = self.titlelabel;
    
    [self.navigationController.view addSubview:self.navHeadImage];
    self.navHeadImage.hidden = YES;
    self.headImage.image = [UIImage imageNamed:@"Address_IconHl"];
    self.navHeadImage.image = [UIImage imageNamed:@"Address_IconHl"];
    [self scrollViewDidScroll:self.scroll];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageAct:)];
    self.headImage.userInteractionEnabled = YES;
    [self.headImage addGestureRecognizer:tap];
    
    [self.btn addTarget:self action:@selector(joinInClasses:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)headImageAct:(UITapGestureRecognizer *)tap{
    NSLog(@"点击头像");
}
- (void)joinInClasses:(id)sender{
    NSLog(@"加入班级");
}



-(void)loadView{
    [super loadView];
    ScrollView * scroll = [[ScrollView alloc] initWithFrame:self.view.bounds with:self.model];
    scroll.delegate = self;
    scroll.bounces = YES;
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    scroll.contentInset = UIEdgeInsetsMake(0, 0, 1, 0);
    scroll.backgroundColor = [UIColor greenColor];
    scroll.showsVerticalScrollIndicator = NO;
    
    _scroll = scroll;
    self.headImage = scroll.headImage;
    self.btn = scroll.btn;
    [self.view addSubview:scroll];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

- (CGSize)receiveSizeWith:(NSString *)text{
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:options attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return rect.size;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint contentOff = scrollView.contentOffset;
    if (contentOff.y < 0 || contentOff.y > 105) {
        if (contentOff.y > 65) {
            [self setHeadAnimationWith:CGPointMake(0, 105)];
        }
        return;
    }
    if (contentOff.y > 65) {
        [self setHeadAnimationWith:scrollView.contentOffset];
        return;
    }
    
    self.headImage.hidden = NO;
    self.navHeadImage.hidden = YES;
    CGFloat width = HEIGHT_HEADIMAGE - (HEIGHT_HEADIMAGE * 0.5) * (contentOff.y / 65);
    self.model.headImageFrame = CGRectMake(0, 0, width, width);
    self.titlelabel.frame = self.model.navImageFrame;
    [self.scroll setNeedsLayout];
}


- (void)setHeadAnimationWith:(CGPoint)contentOff{
    self.headImage.hidden = YES;
    self.navHeadImage.hidden = NO;
    CGRect nframe = self.navHeadImage.frame;
    CGPoint npoint = nframe.origin;
    CGSize nsize = nframe.size;
    self.navHeadImage.frame = CGRectMake(npoint.x, 64 - (contentOff.y - 65), nsize.width, nsize.height);
    
    CGRect lframe = self.model.navImageFrame;
    CGSize lsize = lframe.size;
    CGPoint lpoint = lframe.origin;
    
    self.titlelabel.frame = CGRectMake(npoint.x + nsize.width + (contentOff.y - 65)/10, lpoint.y, lsize.width, lsize.height);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
