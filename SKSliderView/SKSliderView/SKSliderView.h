//
//  SKSliderView.h
//  records_ios
//
//  Created by Somer.King on 2019/5/6.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SKSliderView;
NS_ASSUME_NONNULL_BEGIN

@protocol SKSliderViewDelegate <NSObject>

- (void)sliderViewDidCompleted:(SKSliderView *)sliderView;

@end

@interface SKSliderView : UIView

@property (copy, nonatomic) void(^sliderComplete)(void);
@property (weak, nonatomic) id<SKSliderViewDelegate> delegate;

/** 滑块长*/
@property (assign, nonatomic) CGFloat squareWith;// defalut 60
/** 重置滑块位置*/
- (void)resetSquarePosition;

@end

NS_ASSUME_NONNULL_END
