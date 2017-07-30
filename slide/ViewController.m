//
//  ViewController.m
//  slide
//
//  Created by necfol on 2017/7/30.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
/** scrollview*/
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pgControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(37.5, 30, 300, 130);
    scrollView.backgroundColor = [UIColor orangeColor];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    CGFloat w = self.scrollView.frame.size.width;
    CGFloat h = self.scrollView.frame.size.height;
    int count = 5;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"img_0%d", i];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * w, 0, w, h);
        [self.scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(count * w, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    UIPageControl *pgControl = [[UIPageControl alloc] init];
    pgControl.pageIndicatorTintColor = [UIColor redColor];
    pgControl.currentPageIndicatorTintColor = [UIColor blueColor];
    pgControl.frame = CGRectMake(37.5, 140, 100, 30);
    pgControl.numberOfPages = count;
    self.pgControl = pgControl;
    [self.view addSubview:pgControl];
    self.scrollView.delegate = self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    self.pgControl.currentPage = page;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
