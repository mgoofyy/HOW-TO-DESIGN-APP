//
//  GFSystemDefine.h
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#ifndef GFSystemDefine_h
#define GFSystemDefine_h


#endif /* GFSystemDefine_h */

//存放常用的系统函数配置

//系统的高度和宽度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_BOUND [UIScreen mainScreen].bounds

//HEX 颜色转UIColor
#define GFColorFromHex(hexValue) [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

//weakSelf strongSelf
#define __DEFINE_WEAK_SELF__ __weak __typeof(&*self) weakSelf = self;
#define __DEFINE_STRONG_SELF__ __strong __typeof(&*self) strongSelf = self;

// 设置RGBA颜色值
#define GFRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define GFRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1.f)]

#if __has_feature(objc_arc)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#else
#define WS(weakSelf)  __block __typeof(&*self)weakSelf = self;
#endif

#ifdef COFFEE_DEBUG
#define GFLog( s, ... ) NSLog( @"[调试模式]<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define GFLog( s, ... )
#endif