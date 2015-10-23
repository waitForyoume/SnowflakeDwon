//
//  ViewController.m
//  SnowflakeDwon
//
//  Created by 赵小龙 on 15/10/23.
//  Copyright (c) 2015年 waitForyoume. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(snowDown) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if ([self isViewLoaded] && !self.view.window) {
        self.view = nil;
    }
}

- (void)snowDown {
    UIImageView *snowImage = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flake"]] autorelease];
    int width = arc4random() % 30 + 10;
    int start_x = arc4random() % 375;
    snowImage.frame = CGRectMake(start_x, -40, width, width);
    [self.view addSubview:snowImage];
    [UIView beginAnimations:@"雪花下落" context:snowImage];
    
    [UIView setAnimationDuration:5];
    
    int stop_x = arc4random() % 375;
    snowImage.frame = CGRectMake(stop_x, 667 - width, width, width);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
    
}

- (void)animationDidStop:(NSString *)animtionID finished:(NSNumber *)finished context:(void *)context {
    UIImageView *imageView = (UIImageView *)context;
    if ([animtionID isEqualToString:@"雪花下落"]) {
        [UIView beginAnimations:@"雪花消失" context:imageView];
        [UIView setAnimationDuration:1];
        imageView.alpha = 0.1;
        
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView commitAnimations];
    }
    if ([animtionID isEqualToString:@"雪花消失"]) {
        [imageView removeFromSuperview];
    }
}


@end
