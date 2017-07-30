//
//  ViewController.m
//  slide
//
//  Created by necfol on 2017/7/30.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "ViewController.h"
#import "NecfolSlider.h"

@interface ViewController () <UIScrollViewDelegate>
/** scrollview*/
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pgControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NecfolSlider *slider = [NecfolSlider sliderShow];
    slider.frame = CGRectMake(37.5, 30, 300, 130);
    slider.images = @[
                      @"img_00",
                      @"img_01"
                      ];
    slider.images = @[
                    @"img_00",
                    @"img_01",
                    @"img_02",
                    @"img_03",
                    @"img_04"
                  ];
//    ,
//    @"img_02",
//    @"img_03",
//    @"img_04"    slider.currentColor = [UIColor greenColor];
    slider.otherColor = [UIColor grayColor];
    [self.view addSubview:slider];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
