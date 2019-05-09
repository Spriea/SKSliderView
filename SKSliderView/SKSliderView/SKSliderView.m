//
//  SKSliderView.m
//  records_ios
//
//  Created by Somer.King on 2019/5/6.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import "SKSliderView.h"
#import "UIView+Frame.h"

#define kSquareV_width 60
@interface SKSliderView()

@property (assign, nonatomic) BOOL isSlider;
@property (weak, nonatomic) UIView *squareView;

@end

@implementation SKSliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.lightGrayColor;
        UIView *squareV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSquareV_width, frame.size.height)];
        squareV.backgroundColor = UIColor.redColor;
        [self addSubview:squareV];
        self.squareView = squareV;
        
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panSlider:)];
        [self addGestureRecognizer:panGes];
    }
    return self;
}

// 滑动手势
- (void)panSlider:(UIPanGestureRecognizer *)pan{
    CGPoint pont = [pan translationInView:pan.view];
    CGPoint loc = [pan locationInView:pan.view];
    
    UIView *subV = [[pan.view subviews] firstObject];
    CGPoint subLoc = [pan.view convertPoint:loc toView:subV];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        if ([subV pointInside:subLoc withEvent:nil]) {
            self.isSlider = YES;
        }else{
            self.isSlider = NO;
        }
    }
    
    if (self.isSlider) {
        subV.sk_x = subV.sk_x + pont.x;
        CGFloat maxX = pan.view.sk_width-subV.sk_width;
        if (subV.sk_x >= maxX) {
            subV.sk_x = maxX;
            if (self.sliderComplete) {
                self.sliderComplete();
            }
            if ([self.delegate respondsToSelector:@selector(sliderViewDidCompleted:)]) {
                [self.delegate sliderViewDidCompleted:self];
            }
        }
        
        if (pan.state == UIGestureRecognizerStateEnded) {
            if (subV.sk_x != maxX) {
                [UIView animateWithDuration:0.25 animations:^{
                    subV.sk_x = 0;
                }];
            }
            self.isSlider = NO;
        }
    }
    
    [pan setTranslation:CGPointZero inView:pan.view];
//    SKLog(@"===%@===",NSStringFromCGPoint(pont));
}

- (void)setSquareWith:(CGFloat)squareWith{
    _squareWith = squareWith;
    self.squareView.sk_width = squareWith;
}

- (void)resetSquarePosition{
    self.squareView.sk_x = 0;
}

@end
