//
//  ViewController.m
//  SKSliderView
//
//  Created by Somer.King on 2019/5/9.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import "ViewController.h"
#import "SKSliderView.h"

#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKSliderView *sliderV = [[SKSliderView alloc] initWithFrame:CGRectMake(0, kScreenH-44-100, kScreenW, 44)];
    [sliderV setSquareWith:80];
    
    __weak typeof(self) weakS = self;
    sliderV.sliderComplete = ^{
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"触发滑动时间" message:@"滑块到底了" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertVc addAction:action];
        [weakS presentViewController:alertVc animated:YES completion:nil];
    };
    [self.view addSubview:sliderV];
}


@end
