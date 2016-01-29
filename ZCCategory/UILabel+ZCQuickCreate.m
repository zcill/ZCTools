//
//  UILabel+ZCQuickCreate.m
//
//  Created by 朱立焜 on 15/12/24.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import "UILabel+ZCQuickCreate.h"

@implementation UILabel (ZCQuickCreate)

+ (UILabel *)zc_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *zc_label = [[UILabel alloc] initWithFrame:frame];
    zc_label.text = text;
    zc_label.font = font;
    zc_label.textColor = textColor;
    zc_label.textAlignment = textAlignment;
    
    return zc_label;
}

@end
