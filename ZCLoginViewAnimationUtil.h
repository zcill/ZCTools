//
//  ZCLoginViewAnimationUtil.h
//
//  Created by 朱立焜 on 15/12/21.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZCLoginViewAnimationUtil : NSObject

/**
 *  标题下落动画
 *
 *  @param label 标题label
 *  @param view  父视图
 */
+ (void)zc_titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

/**
 *  下划线动画效果
 *
 *  @param constraint 约束大小
 *  @param view       父视图
 */
+ (void)zc_lineViewAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view;

/**
 *  图标右移动画
 *
 *  @param label 图标label
 *  @param view  父视图
 */
+ (void)zc_phoneIconAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

@end
