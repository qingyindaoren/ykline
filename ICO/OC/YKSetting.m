//
//  YKSetting.m
//  ICO
//
//  Created by yunke on 2018/2/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

#import "YKSetting.h"

@implementation YKSetting
+(instancetype)shareYKSetting{
    static YKSetting *ma ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ma = [YKSetting new];
        
        
    });
    return ma;
}
@end
