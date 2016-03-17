//
//  NSDate+ZCPrettyDate.h
//
//  Created by 朱立焜 on 15/12/17.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZCDateConvert)

/**
 *  获取当前时区时间，不会相差8小时
 *
 *  @return 当前时区时间
 */
+ (NSDate *)currentDate;

#pragma mark - 转换时区、获取当天0点
/**
 *  转换时区TimeZone到当前时区
 *
 *  @param date 需要转化的Date
 *
 *  @return 转化后的Date
 */
+ (NSDate *)zc_localDateWithCurrentDate:(NSDate *)date;

/**
 *  转化传入Date当天为那天0点
 *
 *  @param date       需要转化的Date
 *  @param components 如果有就传入，没有可以创建一个空的传入
 *
 *  @return 转化后的date
 */
+ (NSDate *)zc_zeroOfDateTransformDate:(NSDate *)date Compoents:(NSDateComponents *)components;

#pragma mark - 获取时间日期相关
/**
 * 获取该月的第一天的日期
 */
- (NSDate *)zc_begindayOfMonth;
+ (NSDate *)zc_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)zc_lastdayOfMonth;
+ (NSDate *)zc_lastdayOfMonth:(NSDate *)date;

#pragma mark - 时间格式相关
/**
    时间格式按照YYYY-MM-dd HH:mm:ss排布
 */
- (NSString *)zc_formatDate:(NSDate *)date;
/**
 *  传入一个字符串，返回一个NSDate
 */
+ (NSDate *)zc_dateConvertByString:(NSString *)string;
/**
    时间格式按照x天前、x小时前、x分钟前排布
 */
- (NSString *)zc_prettyDate:(NSTimeInterval)timeInterval;

/**
    时间格式仅按照x天前排布
 */
- (NSString *)zc_prettyDateForOnlyDay:(NSTimeInterval)timeInterval;

@end
