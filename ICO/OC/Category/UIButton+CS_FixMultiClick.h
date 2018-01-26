//
//  UIButton+CS_FixMultiClick.h
//  ICO
//
//  Created by yunke on 2018/1/25.
//  Copyright © 2018年 yunke. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval .5//默认时间间隔
@interface UIButton (CS_FixMultiClick)
@property(nonatomic,assign)NSTimeInterval timeInterval;//用这个给重复点击加间隔
@property(nonatomic,assign)BOOL isIgnoreEvent;//YES不允许点击NO允许点击
@end
