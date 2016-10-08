//
//  ViewController.m
//  PageNumberClock
//
//  Created by DevGuan on 16/10/8.
//  Copyright © 2016年 com.ec. All rights reserved.
//

#import "ViewController.h"
#import "DevPagedClockView.h"
@interface ViewController ()
@property (nonatomic, weak) DevPagedClockView *clockView;
@property (nonatomic, strong) NSTimer *clockTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    dateform.dateFormat = @"HHmmss";
    NSString *dateStr = [dateform stringFromDate:[NSDate date]];
    
    DevPagedClockView *clock = [[DevPagedClockView alloc]initWithTimeString:dateStr];
    clock.frame = CGRectMake(50, 200, 266, 70);
    [self.view addSubview:clock];
    self.clockView = clock;
    
    // 添加定时器
    self.clockTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.clockTimer forMode:NSRunLoopCommonModes];
}
- (void)updateTime
{
    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    dateform.dateFormat = @"HHmmss";
    NSString *dateStr = [dateform stringFromDate:[NSDate date]];
    
    [self.clockView setUpImageViewsWithTimeStr:dateStr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
