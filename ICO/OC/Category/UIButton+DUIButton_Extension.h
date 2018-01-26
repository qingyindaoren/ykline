//
//  UIButton+DUIButton_Extension.h
//  Doctor
//
//  Created by 美融城 on 2017/12/21.
//  Copyright © 2017年 美融城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DUIButton_Extension)
+(instancetype)buttonWithTitle:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor action:(SEL)action target:(id)target backImageNormal:(NSString*)backImageNormal backImageHighlighted:(NSString*)backImageHightlighted backImageDisabled:(NSString*)backImageDisabled;
+(instancetype)buttonWithLeftImage:(NSString*)leftImage title:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor  margin:(CGFloat)margin action:(SEL)action target:(id)target ;
+(instancetype)buttonWithRightImage:(NSString*)rightImage title:(NSString*)title fontSize:(UIFont*)font textColor:(UIColor *)textColor  margin:(CGFloat)margin action:(SEL)action target:(id)target;

@end
