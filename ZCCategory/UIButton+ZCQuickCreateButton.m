//
//  UIButton+ZCQuickCreateButton.m
//
//  Created by 朱立焜 on 15/10/1.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import "UIButton+ZCQuickCreateButton.h"

@implementation UIButton (ZCQuickCreateButton)

+ (instancetype)zc_initButtonWithTitle:(NSString *)title
                          ImageName:(NSString *)imageName
                  selectedImageName:(NSString *)selectedImageName
                                tag:(NSInteger)tag
         adjustImageWhenHighlighted:(BOOL)adjustImageHighLighted {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    button.tag = tag;
    button.adjustsImageWhenHighlighted = adjustImageHighLighted;
 
    return button;
}

- (void)zc_setButtonTitleNormalColor:(UIColor *)titleNormalColor
                  titleSelectedColor:(UIColor *)titleSelectedColor
                           titleFont:(UIFont *)titleFont
                     titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                     imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    // 设置正常状态和选中状态下字体的颜色
    [self setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [self setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    
    // 设置title的字体
    self.titleLabel.font = titleFont;
    
    // 设置button上标题和图片的偏移量
    self.titleEdgeInsets = titleEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
}

@end
