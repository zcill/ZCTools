//
//  define.h
//  
//
//  Created by 朱立焜 on 15/9/1.
//
//

#ifndef _define_h
#define _define_h

#pragma mark - 尺寸宏

// 状态栏高度
#define kStatusBar_Height 20
// 导航栏高度
#define kNavigationBar_Height 44
// 导航栏BarButton按钮宽高
#define kNavigationBarIcon 20
// tabBar高度
#define kTabBar_Height 49
// tabBar按钮宽高
#define kTabBarIcon 40
// 获取屏幕宽高
#define kSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



#pragma mark - 系统宏

// 获取iOS系统版本
#define kGetSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define kCurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
// 获取当前语言
#define kCurrentLangage ([[NSLocale preferredLangages] objectAtIndex:0])



#pragma mark - 颜色宏

// 经常使用的灰色
#define kGrayColor [UIColor colorWithRed:235/255.f green:235/255.f blue:235/255.f alpha:1]
// 经常使用的淡灰色
#define kLightGrayColor [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1]
// 背景色
#define kBackgroundColor [UIColor colorWithRed:242/255.f green:236/255.f blue:231/255.f alpha:1]
// 转化RGB颜色
#define kRGBA(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define krgba(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]



#pragma mark - 打印宏
// DLog will output like NSLog only when the DEBUG variable is set
// DLog在Debug模式下才会打印，Release模式不会打印
#ifdef DEBUG

#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else
#define DLog(...)
#endif

// ALog will always output like NSLog
// ALog像NSLog一样无论Debug还是Release都会打印
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// ULog will show the UIAlertView only when the DEBUG variable is set
// ULog会把需要打印的东西用AlertView显示出来，同样是只在Debug模式下生效
#ifdef DEBUG

#define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }

#else
#define ULog(...)
#endif



#pragma mark - 导入头文件

#import "ZCLoginViewAnimationUtil.h"
#import "ZCCategoryHeader.h"


#endif
