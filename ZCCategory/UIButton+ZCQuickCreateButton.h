//
//  UIButton+ZCQuickCreateButton.h
//
//  Created by 朱立焜 on 15/10/1.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZCQuickCreateButton)

+ (instancetype)zc_initButtonWithTitle:(NSString *)title
                          ImageName:(NSString *)imageName
                  selectedImageName:(NSString *)selectedImageName
                                tag:(NSInteger)tag
         adjustImageWhenHighlighted:(BOOL)adjustImageHighLighted;

- (void)zc_setButtonTitleNormalColor:(UIColor *)titleNormalColor
                  titleSelectedColor:(UIColor *)titleSelectedColor
                           titleFont:(UIFont *)titleFont
                     titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                     imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;


@end
