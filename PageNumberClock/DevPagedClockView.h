//
//  DevPagedClockView.h
//  PageNumberClock
//
//  Created by DevGuan on 16/10/8.
//  Copyright © 2016年 com.ec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevPagedClockView : UIView
/**
 *  初始化
 *
 *  @param timeStr 初始化时间
 *
 *  @return 初始化好的view
 */
- (instancetype)initWithTimeString:(NSString *)timeStr;

- (void)setUpImageViewsWithTimeStr:(NSString *)timeStr;
@end
