//
//  NSDate+ZCPrettyDate.m
//
//  Created by 朱立焜 on 15/12/17.
//  Copyright © 2015年 zcill. All rights reserved.
//

#import "NSDate+ZCPrettyDate.h"

@implementation NSDate (ZCDateConvert)

#pragma mark - 获取正常的当前时间，不会相差8小时
+ (NSDate *)currentDate {
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    return localDate;
}

#pragma mark - 转换时区、获取当天0点
+ (NSDate *)zc_localDateWithCurrentDate:(NSDate *)date {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    
    return localDate;
}

+ (NSDate *)zc_zeroOfDateTransformDate:(NSDate *)date Compoents:(NSDateComponents *)components {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    components = [calendar components:NSUIntegerMax fromDate:date];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    return [NSDate zc_localDateWithCurrentDate:[calendar dateFromComponents:components]];
    
}

#pragma mark - 获取时间相关

- (NSUInteger)day {
    return [NSDate day:self];
}

+ (NSUInteger)day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

- (NSDate *)zc_begindayOfMonth {
    return [NSDate zc_begindayOfMonth:self];
}

+ (NSDate *)zc_begindayOfMonth:(NSDate *)date {
    return [self dateAfterDate:date day:-[date day] + 1];
}

+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)zc_lastdayOfMonth {
    return [NSDate zc_lastdayOfMonth:self];
}

+ (NSDate *)zc_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self zc_begindayOfMonth:date];
    return [[lastDate dateAfterMonth:1] dateAfterDay:-1];
}

- (NSDate *)dateAfterMonth:(NSUInteger)month {
    return [NSDate dateAfterDate:self month:month];
}

- (NSDate *)dateAfterDay:(NSUInteger)day {
    return [NSDate dateAfterDate:self day:day];
}

+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

#pragma mark - 时间格式相关

- (NSString *)zc_formatDate:(NSDate *)date {
    
    NSString *formatDate;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    formatDate = [formatter stringFromDate:date];
    
    return formatDate;
}

- (NSString *)zc_prettyDate:(NSTimeInterval)timeInterval {
    
    NSString *prettyTimestamp;
    
    float delta = timeInterval * -1;
    
    if (delta < 60) {
        prettyTimestamp = @"刚刚";
    } else if (delta < 120) {
        prettyTimestamp = @"1分钟前";
    } else if (delta < 3600) {
        prettyTimestamp = [NSString stringWithFormat:@"%d分钟前", (int) floor(delta/60.0) ];
    } else if (delta < 7200) {
        prettyTimestamp = @"1小时前";
    } else if (delta < 86400) {
        prettyTimestamp = [NSString stringWithFormat:@"%d小时前", (int) floor(delta/3600.0) ];
    } else if (delta < ( 86400 * 2 ) ) {
        prettyTimestamp = @"1天前";
    } else if (delta < ( 86400 * 7 ) ) {
        prettyTimestamp = [NSString stringWithFormat:@"%d天前", (int) floor(delta/86400.0) ];
    } else {
            NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
    
            prettyTimestamp = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self]];
        }
    
    return prettyTimestamp;
    
}

- (NSString *)zc_prettyDateForOnlyDay:(NSTimeInterval)timeInterval {
    
    NSString * prettyTimestamp;
    
    float delta = timeInterval * -1;
    
    if (delta < 86400) {
        prettyTimestamp = @"今天";
    } else if (delta < ( 86400 * 2 ) ) {
        prettyTimestamp = @"昨天";
    } else // if (delta < ( 86400 * 7 ) )
    {
        prettyTimestamp = [NSString stringWithFormat:@"%d天前", (int) floor(delta/86400.0) ];
    }
    return prettyTimestamp;
    
}

@end
