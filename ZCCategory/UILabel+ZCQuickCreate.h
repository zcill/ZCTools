//
//  UILabel+ZCQuickCreate.h
//
//  Created by 朱立焜 on 15/12/24.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZCQuickCreate)

+ (UILabel *)zc_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
