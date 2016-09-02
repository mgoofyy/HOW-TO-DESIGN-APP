//
//  GFThemeColor.h
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#ifndef GFThemeColor_h
#define GFThemeColor_h


#endif /* GFThemeColor_h */


//当前系统的主题配置

//当前应用的主题颜色
#define GFMainThemeColor          GFColorFromHex(0x413e4f)
//系统背景色
#define GFViewBGColor             GFColorFromHex(0xebebf1)

//文字颜色 n种文字颜色

//和当前主题颜色相同的文字颜色
#define GFTextImpotColor01        GFMainThemeColor
//近黑色 表示重要的文本
#define GFTextImpotColor02        GFColorFromHex(0x323232)

//常规颜色 - 用于副标题展示
#define GFTextNormalColor01       GFColorFromHex(0x666666)
#define GFTextNormalColor02       GFColorFromHex(0x8e8e8e)


//Line Color - 主要用于app中分割线的展示
#define GFLineViewColor           GFColorFromHex(0xdddddd)


#define GFTextWhiteColor [UIColor whiteColor]