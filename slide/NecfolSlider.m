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
    self.pgControl.numberOfPages = count;
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
    // 设置pageControl
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = self.frame.size.width - pageW;
    CGFloat pageY = self.frame.size.height - pageH;
    self.pgControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    //不能以subviews来计算，因为会把滚动条算进来
//    NSInteger num = self.scrollView.subviews.count;
    NSInteger num = self.images.count;
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

