//
//  ZCLoginViewAnimationUtil.m
//
//  Created by 朱立焜 on 15/12/21.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import "ZCLoginViewAnimationUtil.h"

static CGFloat const kBottomLineWidth = 224.0;

@implementation ZCLoginViewAnimationUtil

// 标题下落动画
+ (void)zc_titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view {
    [UIView animateWithDuration:1.5 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
}

// 下划线扩张动画
+ (void)zc_lineViewAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view {
    
    constraint.constant = kBottomLineWidth;
    [UIView animateWithDuration:1.5 animations:^{
        [view layoutIfNeeded];
    }];
    
}

// 图标右移动画
+ (void)zc_phoneIconAnimationWithLabel:(UILabel *)label withView:(UIView *)view {
    [UIView animateWithDuration:1.5 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
}

@end
