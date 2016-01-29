//
//  UIImage+Tool.m
//  
//
//  Created by 朱立焜 on 15/9/28.
//
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)zc_imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)borderColor {
    
    // 圆环的宽度
    CGFloat borderW = border;
    
    // 加载旧的图片
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 新的图片尺寸
    CGFloat imageW = oldImage.size.width + 2 * borderW ;
    CGFloat imageH = oldImage.size.height + 2 * borderW;
    
    // 设置新的图片的尺寸
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    
    // 画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    
    // 获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 添加到上下文
    CGContextAddPath(contextRef, path.CGPath);
    
    [borderColor set];
    
    // 渲染
    CGContextFillPath(contextRef);
    
    CGRect clipR = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
    
    // 画图：正切于旧图片的圆
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    // 设置裁剪区域
    [clipPath addClip];
    
    // 画图片
    [oldImage drawAtPoint:CGPointMake(borderW, borderW)];
    
    // 获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+ (instancetype)zc_imageWithCaptureView:(UIView *)captureView {
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(captureView.bounds.size, NO, 0.0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 渲染控制器view的图层到上下文
    // 图层只能用渲染不能用draw
    [captureView.layer renderInContext:ctx];
    
    // 获取截屏图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
