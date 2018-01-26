//
//  UIButton+Category.m
//  自己的扩张类
//
//  Created by mac iko on 12-10-25.
//  Copyright (c) 2012年 mac iko. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)
-(void)centerButtonAndImageWithSapcing:(CGFloat)spacing{

    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    NSLog(@"%f %f",self.titleLabel.frame.origin.x,self.titleLabel.frame.origin.y);
    NSLog(@"%f",imageSize.height);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0);
//    titleSize = self.titleLabel.frame.size;
    NSLog(@"%f %f",self.titleLabel.frame.origin.x,self.titleLabel.frame.origin.y);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0 - (titleSize.height + spacing), 0.0, 0.0, 0.0 - titleSize.width);
}

-(void)exchangeImageAndTitleWithSpacing:(CGFloat)spacing{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width-spacing, 0.0, 0.0);
//    titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0+titleSize.width+imageSize.width, 0, 0);
}

-(void)centerMyTitle:(CGFloat)spacing{
    CGSize imageSize = self.imageView.frame.size;
//    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, 0.0, 0.0);
//    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width - spacing, 0.0, 0.0);
}

-(void)normorlMyTitle{
//    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsZero;
//    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets =UIEdgeInsetsZero;
}

-(void)setBackgroundImage:(UIImage *)image{
    CGRect rect;
    rect       = self.frame;
    rect.size  = image.size;            // set button size as image size
    self.frame = rect;
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

-(void)setBackgroundImageByName:(NSString *)imageName{
    [self setBackgroundImage:[UIImage imageNamed:imageName]];
}


- (void)normalTitle:(NSString *)string
{
    [self setTitle:string forState:UIControlStateNormal];
}

- (void)normalImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)highlightTitle:(NSString *)string
{
    [self setTitle:string forState:UIControlStateHighlighted];
}

- (void)highlightImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateHighlighted];
}

- (NSString *)normalTitle
{
    return [self titleForState:UIControlStateNormal];
}
- (void)setNormalTitle:(NSString *)normalTitle
{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

- (NSString *)highlightedTitle
{
    return [self titleForState:UIControlStateHighlighted];
}
- (void)setHighlightedTitle:(NSString *)highlightedTitle
{
    [self setTitle:highlightedTitle forState:UIControlStateHighlighted];
}

- (NSString *)disabledTitle
{
    return [self titleForState:UIControlStateDisabled];
}
- (void)setDisabledTitle:(NSString *)disabledTitle
{
    [self setTitle:disabledTitle forState:UIControlStateDisabled];
}

- (NSString *)selectedTitle
{
    return [self titleForState:UIControlStateSelected];
}
- (void)setSelectedTitle:(NSString *)selectedTitle
{
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}


- (UIColor *)normalTitleColor
{
    return [self titleColorForState:UIControlStateNormal];
}
- (void)setNormalTitleColor:(UIColor *)normalTitleColor
{
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
}

- (UIColor *)highlightedTitleColor
{
    return [self titleColorForState:UIControlStateHighlighted];
}
- (void)setHighlightedTitleColor:(UIColor *)highlightedTitleColor
{
    [self setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
}

- (UIColor *)disabledTitleColor
{
    return [self titleColorForState:UIControlStateDisabled];
}
- (void)setDisabledTitleColor:(UIColor *)disabledTitleColor
{
    [self setTitleColor:disabledTitleColor forState:UIControlStateDisabled];
}

- (UIColor *)selectedTitleColor
{
    return [self titleColorForState:UIControlStateSelected];
}
- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor
{
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}


- (UIColor *)normalTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateNormal];
}
- (void)setNormalTitleShadowColor:(UIColor *)normalTitleShadowColor
{
    [self setTitleShadowColor:normalTitleShadowColor forState:UIControlStateNormal];
}

- (UIColor *)highlightedTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateHighlighted];
}
- (void)setHighlightedTitleShadowColor:(UIColor *)highlightedTitleShadowColor
{
    [self setTitleShadowColor:highlightedTitleShadowColor forState:UIControlStateHighlighted];
}

- (UIColor *)disabledTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateDisabled];
}
- (void)setDisabledTitleShadowColor:(UIColor *)disabledTitleShadowColor
{
    [self setTitleShadowColor:disabledTitleShadowColor forState:UIControlStateDisabled];
}

- (UIColor *)selectedTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateSelected];
}
- (void)setSelectedTitleShadowColor:(UIColor *)selectedTitleShadowColor
{
    [self setTitleShadowColor:selectedTitleShadowColor forState:UIControlStateSelected];
}


- (UIImage *)normalImage
{
    return [self imageForState:UIControlStateNormal];
}
- (void)setNormalImage:(UIImage *)normalImage
{
    [self setImage:normalImage forState:UIControlStateNormal];
}

- (UIImage *)highlightedImage
{
    return [self imageForState:UIControlStateHighlighted];
}
- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

- (UIImage *)disabledImage
{
    return [self imageForState:UIControlStateDisabled];
}
- (void)setDisabledImage:(UIImage *)disabledImage
{
    [self setImage:disabledImage forState:UIControlStateDisabled];
}

- (UIImage *)selectedImage
{
    return [self imageForState:UIControlStateSelected];
}
- (void)setSelectedImage:(UIImage *)selectedImage
{
    [self setImage:selectedImage forState:UIControlStateSelected];
}


- (UIImage *)normalBackgroundImage
{
    return [self backgroundImageForState:UIControlStateNormal];
}
- (void)setNormalBackgroundImage:(UIImage *)normalBackgroundImage
{
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
}

- (UIImage *)highlightedBackgroundImage
{
    return [self backgroundImageForState:UIControlStateHighlighted];
}
- (void)setHighlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    [self setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
}

- (UIImage *)disabledBackgroundImage
{
    return [self backgroundImageForState:UIControlStateDisabled];
}
- (void)setDisabledBackgroundImage:(UIImage *)disabledBackgroundImage
{
    [self setBackgroundImage:disabledBackgroundImage forState:UIControlStateDisabled];
}

- (UIImage *)selectedBackgroundImage
{
    return [self backgroundImageForState:UIControlStateSelected];
}
- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage
{
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
}

- (void)centerContent:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = [self.titleLabel sizeThatFits:self.bounds.size];
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0 - (titleSize.height + spacing), 0.0, 0.0, 0.0 - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0 - imageSize.width, 0.0 - (imageSize.height + spacing), 0.0);
    
}

@end
