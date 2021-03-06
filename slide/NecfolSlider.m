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
@property (nonatomic, strong) NSTimer *timer;

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
//    重复赋值时，删除之前的view
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger count = images.count;
    self.pgControl.numberOfPages = count;
//    self.pgControl.hidesForSinglePage = YES;
    if(count <= 1) {
        self.pgControl.hidden = YES;
    } else {
        self.pgControl.hidden = NO;
    }
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
    [self startTimer];
}
-(void)nexPage {
    NSInteger pagenum = self.pgControl.currentPage + 1;
    if(pagenum == self.pgControl.numberOfPages) {
        pagenum = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(pagenum * self.scrollView.frame.size.width, 0) animated:YES];
}
-(void)setCurrentColor:(UIColor *)currentColor {
    _currentColor = currentColor;
    self.pgControl.currentPageIndicatorTintColor = currentColor;
}
-(void)setOtherColor:(UIColor *)otherColor {
    _otherColor = otherColor;
    self.pgControl.pageIndicatorTintColor = otherColor;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    self.pgControl.currentPage = page;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];

}
-(void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nexPage) userInfo:nil repeats:YES];
//    将定时器添加到主线程队列中
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}
-(void) stopTimer {
    [self.timer invalidate];
    self.timer = nil;

}
+(instancetype)sliderShow {
    return [[self alloc] init];
}

@end

