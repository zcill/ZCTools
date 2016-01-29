//
//  UIImage+Tool.h
//  
//
//  Created by 朱立焜 on 15/9/28.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 *  生成一个带圆环的图片
 *
 *  @param name        图片的名称
 *  @param border      圆环的宽度
 *  @param borderColor 圆环的颜色
 *
 */
+ (instancetype)zc_imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)borderColor;

/**
 *  截屏
 *
 *  @param captureView 需要截屏的视图
 *
 */
+ (instancetype)zc_imageWithCaptureView:(UIView *)captureView;

@end
