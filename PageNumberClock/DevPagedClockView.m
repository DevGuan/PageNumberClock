//
//  DevPagedClockView.m
//  PageNumberClock
//
//  Created by DevGuan on 16/10/8.
//  Copyright © 2016年 com.ec. All rights reserved.
//

#import "DevPagedClockView.h"
@interface DevPagedClockView()
/**
 *  秒针个位  0--9
 */
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView1;
/**
 *  秒针十位  0--5
 */
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView2;
/**
 *  分针个位  0--9
 */
@property (weak, nonatomic) IBOutlet UIImageView *minuteImageView1;
/**
 *  分针十位  0--5
 */
@property (weak, nonatomic) IBOutlet UIImageView *minuteImageView2;
/**
 *  时针个位  0--9
 */
@property (weak, nonatomic) IBOutlet UIImageView *hourImageView1;
/**
 *  时针十位  0--2
 */
@property (weak, nonatomic) IBOutlet UIImageView *hourImageView2;

@property (nonatomic, strong) NSMutableArray<UIImage *> *iamgesArray;
@end
@implementation DevPagedClockView
- (instancetype)initWithTimeString:(NSString *)timeStr
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"DevPagedClockView" owner:self options:nil]lastObject];
    }
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSString *imageNum = [NSString stringWithFormat:@"%d",i];
        UIImage *image = [UIImage imageNamed:imageNum];
        [imageArray addObject:image];
    }
    self.iamgesArray = imageArray;
    [self setUpImageViewsWithTimeStr:timeStr];
    return self;
}

- (void)setUpImageViewsWithTimeStr:(NSString *)timeStr
{
    // 分段获取 时间字符串里的每个字符 转换数字 从数组中取出相应的图片
    
    // 时针十位
    int index = [[timeStr substringWithRange:NSMakeRange(0, 1)] intValue];
    if (self.hourImageView2.image != self.iamgesArray[index]) {
        self.hourImageView2.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.hourImageView2];
    }
    // 时针个位
    index = [[timeStr substringWithRange:NSMakeRange(1, 1)] intValue];
    if (self.hourImageView1.image != self.iamgesArray[index]) {
        self.hourImageView1.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.hourImageView1];
    }
    // 分针十位
    index = [[timeStr substringWithRange:NSMakeRange(2, 1)] intValue];
    if (self.minuteImageView2.image != self.iamgesArray[index]) {
        self.minuteImageView2.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.minuteImageView2];
    }
    // 分针个位
    index = [[timeStr substringWithRange:NSMakeRange(3, 1)] intValue];
    if (self.minuteImageView1.image != self.iamgesArray[index]) {
        self.minuteImageView1.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.minuteImageView1];
    }
    // 秒针十位
    index = [[timeStr substringWithRange:NSMakeRange(4, 1)] intValue];
    if (self.secondImageView2.image != self.iamgesArray[index]) {
        self.secondImageView2.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.secondImageView2];
    }
    // 秒针个位
    index = [[timeStr substringWithRange:NSMakeRange(5, 1)] intValue];
    if (self.secondImageView1.image != self.iamgesArray[index]) {
        self.secondImageView1.image = self.iamgesArray[index];
        // 添加动画
        [self transmitionForImageView:self.secondImageView1];
    }
}
- (void)transmitionForImageView:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = kCATransitionFromTop;
    animation.duration = 0.3;
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}
@end
