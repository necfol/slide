//
//  NecfolSlider.h
//  slide
//
//  Created by necfol on 2017/7/30.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NecfolSlider : UIView

@property (nonatomic, strong) NSArray *images;
/** currentcolor*/
@property (nonatomic, strong) UIColor *currentColor;
/** othercolor*/
@property (nonatomic, strong) UIColor *otherColor;

+(instancetype)sliderShow;

@end
