//
//  UIButton+Category.h
//  自己的扩张类
//
//  Created by mac iko on 12-10-25.
//  Copyright (c) 2012年 mac iko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *highlightedTitle;
@property (nonatomic, copy) NSString *disabledTitle;
@property (nonatomic, copy) NSString *selectedTitle;

@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *highlightedTitleColor;
@property (nonatomic, strong) UIColor *disabledTitleColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;

@property (nonatomic, strong) UIColor *normalTitleShadowColor;
@property (nonatomic, strong) UIColor *highlightedTitleShadowColor;
@property (nonatomic, strong) UIColor *disabledTitleShadowColor;
@property (nonatomic, strong) UIColor *selectedTitleShadowColor;

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, strong) UIImage *disabledImage;
@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, strong) UIImage *normalBackgroundImage;
@property (nonatomic, strong) UIImage *highlightedBackgroundImage;
@property (nonatomic, strong) UIImage *disabledBackgroundImage;
@property (nonatomic, strong) UIImage *selectedBackgroundImage;


-(void)centerButtonAndImageWithSapcing:(CGFloat)spacing;
-(void)exchangeImageAndTitleWithSpacing:(CGFloat)spacing;
-(void)centerMyTitle:(CGFloat)spacing;
-(void)normorlMyTitle;
//button根据image大小改变
- (void)setBackgroundImage:(UIImage*)image;
- (void)setBackgroundImageByName:(NSString*)imageName;

- (void)normalTitle:(NSString *)string;
- (void)normalImage:(UIImage *)image;
- (void)highlightTitle:(NSString *)string;
- (void)highlightImage:(UIImage *)image;
- (void)centerContent:(CGFloat)spacing;
@end
