//
//  UILabel+ZCStringFrame.m
//
//  Created by 朱立焜 on 16/1/15.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "UILabel+ZCStringFrame.h"

@implementation UILabel (ZCStringFrame)

// 让Label自适应字体高度
- (CGSize)zc_boundingRectWithSize:(CGSize)size {
    
    NSDictionary *attributes = @{NSFontAttributeName: self.font};
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:attributes
                                             context:nil].size;
    return retSize;
    
}

@end
