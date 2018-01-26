//
//  UIButton+EnlargeTouchArea.h
//  基础架构
//
//  Created by yunke on 2018/1/24.
//  Copyright © 2018年 美融城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setEnlargeEdge:(CGFloat) size; 
@end
