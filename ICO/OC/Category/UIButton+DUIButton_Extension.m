//
//  UIButton+DUIButton_Extension.m
//  Doctor
//
//  Created by 美融城 on 2017/12/21.
//  Copyright © 2017年 美融城. All rights reserved.
//

#import "UIButton+DUIButton_Extension.h"

@implementation UIButton (DUIButton_Extension)
//文字，背景图
+(instancetype)buttonWithTitle:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor action:(SEL)action target:(id)target backImageNormal:(NSString*)backImageNormal backImageHighlighted:(NSString*)backImageHightlighted backImageDisabled:(NSString*)backImageDisabled {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        [b setTitle:title forState:UIControlStateNormal];
        b.titleLabel.font = font;
        [b setTitleColor:textColor forState:UIControlStateNormal];
    }

    if (action&&target) {
       [b addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
   
    if (backImageNormal) {
     [b setBackgroundImage:[UIImage imageNamed: backImageNormal] forState:UIControlStateNormal];
    }
    if (backImageHightlighted) {
           [b setBackgroundImage:[UIImage imageNamed: backImageHightlighted] forState:UIControlStateHighlighted];
    }
    if (backImageDisabled) {
       [b setBackgroundImage:[UIImage imageNamed: backImageDisabled] forState:UIControlStateDisabled];
    }
    [b sizeToFit];
    return  b;
    
}
//图片在左边，设置间距
+(instancetype)buttonWithLeftImage:(NSString*)leftImage title:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor  margin:(CGFloat)margin action:(SEL)action target:(id)target {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [b setTitle:title forState:UIControlStateNormal];
        b.titleLabel.font = font;
        [b setTitleColor:textColor forState:UIControlStateNormal];
    }
   
    if (action&&target) {
         [b addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (leftImage) {
      [b setImage:[UIImage imageNamed: leftImage] forState:UIControlStateNormal];
    }
    [b sizeToFit];
     b.titleEdgeInsets = UIEdgeInsetsMake(0.0, margin, 0.0, -margin);
//    b.imageEdgeInsets = UIEdgeInsetsMake(0.0, -margin, 0.0, margin);
    return b;
}
//图片在右边，设置间距
+(instancetype)buttonWithRightImage:(NSString*)rightImage title:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor  margin:(CGFloat)margin action:(SEL)action target:(id)target{
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [b setTitle:title forState:UIControlStateNormal];
        b.titleLabel.font = font;
        [b sizeToFit];
        [b setTitleColor:textColor forState:UIControlStateNormal];
    }

    if (action&&target) {
        [b addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (rightImage) {
        [b setImage:[UIImage imageNamed: rightImage] forState:UIControlStateNormal];
        
       [b sizeToFit];
       
        b.titleEdgeInsets = UIEdgeInsetsMake(0,-b.currentImage.size.width, 0, b.currentImage.size.width);
         b.imageEdgeInsets = UIEdgeInsetsMake(0,b.bounds.size.width+margin-b.currentImage.size.width, 0, -(b.bounds.size.width+margin-b.currentImage.size.width));
    }
    return b;
}


@end
