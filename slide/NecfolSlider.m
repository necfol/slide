//
//  NecfolSlider.m
//  slide
//
//  Created by necfol on 2017/7/30.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "NecfolSlider.h"

@interface NecfolSlider () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pgControl;

@end

@implementation NecfolSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setImages:(NSArray *)images {
    _images = images;
    NSInteger count = images.count;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:images[i]];
        [self.scrollView addSubview:imageView];
    }
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        UIPageControl *pgControl = [[UIPageControl alloc] init];
        scrollView.backgroundColor = [UIColor orangeColor];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        pgControl.pageIndicatorTintColor = [UIColor redColor];
        pgControl.currentPageIndicatorTintColor = [UIColor blueColor];
        pgControl.frame = CGRectMake(37.5, 90, 100, 30);
        self.scrollView = scrollView;
        self.pgControl = pgControl;
        self.scrollView.delegate = self;
        [self addSubview:scrollView];
        [self addSubview:pgControl];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    NSInteger num = self.scrollView.subviews.count;
    self.pgControl.numberOfPages = num;
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * num, self.frame.size.height);
    for (int i = 0; i < num; i++) {
        UIImageView *imgView = self.scrollView.subviews[i];
        imgView.frame = CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height);
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    self.pgControl.currentPage = page;
}
+(instancetype)sliderShow {
    return [[self alloc] init];
}

@end

