//
//  UIColor+Y_StockChart.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "UIColor+Y_StockChart.h"

@implementation UIColor (Y_StockChart)

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}
+(UIColor*)selectColor{
    return [UIColor blueColor];
}
#pragma mark 所有图表的背景颜色
+(UIColor *)backgroundColor
{
    NSInteger  saveTNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segToneIndexKey"];
    
    NSInteger n = saveTNumber  - 400 - 2000;
    switch (n) {
        case 1:{
           return [UIColor whiteLightColor];
        }
            break;
        case 2:{
            return  [UIColor colorWithRGBHex:0x181c20];
        }
            break;
        case 3:{
             return  [UIColor whiteLightColor];
        }
            break;
            
        default:
            break;
    }
    return [UIColor colorWithRGBHex:0x181c20];
}
+(UIColor*)lightBackgroundColor{
    NSInteger  saveTNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segToneIndexKey"];
    
    NSInteger n = saveTNumber  - 400 - 2000;
    switch (n) {
        case 1:{
            return [UIColor lightBlackColor];
        }
            break;
        case 2:{
            return  [UIColor backgroundColor];
        }
            break;
        case 3:{
            return  [UIColor lightBlackColor];
        }
            break;
            
        default:
            break;
    }
    return [UIColor colorWithRGBHex:0x1d2227];
}
+(UIColor*)lightBlackColor{
    return [UIColor colorWithRGBHex:0xe6e6e6];
}
#pragma mark 辅助背景色
+(UIColor *)assistBackgroundColor
{
    NSInteger  saveTNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segToneIndexKey"];
    
    NSInteger n = saveTNumber  - 400 - 2000;
    switch (n) {
        case 1:{
            return [UIColor whiteLightColor];
        }
            break;
        case 2:{
            return [self assistColor];
        }
            break;
        case 3:{
            return  [UIColor whiteLightColor];
        }
            break;
            
        default:
            break;
    }
    return [self assistColor];
}
+(UIColor *)assistColor{
    return  [UIColor colorWithRGBHex:0x1d2227];
}
+(UIColor*)whiteLightColor{
    return [UIColor whiteColor];
}

#pragma mark 涨的颜色
+(UIColor *)increaseColor
{
    return [UIColor colorWithRGBHex:0xff5353];
}

#pragma mark 跌的颜色
+(UIColor *)decreaseColor
{
    return [UIColor colorWithRGBHex:0x00b07c];
}

#pragma mark 主文字颜色
+(UIColor *)mainTextColor
{
    NSInteger  saveTNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segToneIndexKey"];
    
    NSInteger n = saveTNumber  - 400 - 2000;
    switch (n) {
        case 1:{
            return [UIColor lightMainTextColor];
        }
            break;
        case 2:{
      
            return [UIColor subBtnColor];
        }
            break;
        case 3:{
            return  [UIColor lightMainTextColor];
        }
            break;
            
        default:
            break;
    }
  
    return [UIColor subBtnColor];
}
+(UIColor *)subBtnColor{
    return [UIColor colorWithRGBHex:0xdcdcdc];
}
+(UIColor *)lightMainTextColor
{
    return [UIColor colorWithRGBHex:0x333333];
}
#pragma mark 辅助文字颜色
+(UIColor *)assistTextColor
{

    return [UIColor colorWithRGBHex:0x727F8A];
}

#pragma mark 分时线下面的成交量线的颜色
+(UIColor *)timeLineVolumeLineColor
{
    return [UIColor colorWithRGBHex:0x2d333a];
}

#pragma mark 分时线界面线的颜色
+(UIColor *)timeLineLineColor
{
    return [UIColor colorWithRGBHex:0x49a5ff];
}

#pragma mark 长按时线的颜色
+(UIColor *)longPressLineColor
{
//    return [UIColor colorWithRGBHex:0xff5353];
    return [UIColor colorWithRGBHex:0xDE5E26];
}

#pragma mark ma5的颜色
+(UIColor *)ma7Color
{
    return [UIColor colorWithRGBHex:0xff783c];
}

#pragma mark ma30颜色
+(UIColor *)ma30Color
{
    return [UIColor colorWithRGBHex:0x49a5ff];
}

#pragma mark BOLL_MB的颜色
+(UIColor *)BOLL_MBColor
{
    return [UIColor whiteColor];
}

#pragma mark BOLL_UP的颜色
+(UIColor *)BOLL_UPColor
{
    return [UIColor purpleColor];
}

#pragma mark BOLL_DN的颜色
+(UIColor *)BOLL_DNColor
{
    return [UIColor greenColor];
}

@end
