//
//  Y_StockChartRightYView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_StockChartRightYView.h"
#import "UIColor+Y_StockChart.h"
#import "Masonry.h"
#import "Y_StockChartConstant.h"

@interface Y_StockChartRightYView ()

@property(nonatomic,strong) UILabel *maxValueLabel;

@property(nonatomic,strong) UILabel *middleValueLabel;

@property(nonatomic,strong) UILabel *minValueLabel;

@end


@implementation Y_StockChartRightYView
-(void)setIsFull:(BOOL)isFull{
    _isFull = isFull;
}
-(void)setMaxValue:(CGFloat)maxValue
{
    _maxValue = maxValue;
    if (fabs(maxValue)<1000&&fabs(maxValue)>=10) {
        self.maxValueLabel.text = [NSString stringWithFormat:@"%.4f",maxValue];
    }else if (fabs(maxValue)<10){
       self.maxValueLabel.text = [NSString stringWithFormat:@"%.6f",maxValue];
    }
    else{
    self.maxValueLabel.text = [NSString stringWithFormat:@"%.2f",maxValue];
    }
}

-(void)setMiddleValue:(CGFloat)middleValue
{
    _middleValue = middleValue;
    
    if (fabs(middleValue)<1000&&fabs(middleValue)>=10) {
     self.middleValueLabel.text = [NSString stringWithFormat:@"%.4f",middleValue];
    }else if (fabs(middleValue)<10){
        self.middleValueLabel.text = [NSString stringWithFormat:@"%.6f",middleValue];
    }
    else{
        self.middleValueLabel.text = [NSString stringWithFormat:@"%.2f",middleValue];
    }
    
}

-(void)setMinValue:(CGFloat)minValue
{
    _minValue = minValue;
    
    if (fabs(minValue)<1000&&fabs(minValue)>=10) {
      self.minValueLabel.text = [NSString stringWithFormat:@"%.4f",minValue];
    }else if (fabs(minValue)<10){
        self.minValueLabel.text = [NSString stringWithFormat:@"%.6f",minValue];
    }
    else{
    self.minValueLabel.text = [NSString stringWithFormat:@"%.2f",minValue];
    }
    
}

-(void)setMinLabelText:(NSString *)minLabelText
{
    _minLabelText = minLabelText;
    self.minValueLabel.text = minLabelText;
}

#pragma mark - get方法
#pragma mark maxPriceLabel的get方法
-(UILabel *)maxValueLabel
{
    if (!_maxValueLabel) {
        _maxValueLabel = [self private_createLabel];
        [self addSubview:_maxValueLabel];
        [_maxValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.width.equalTo(self);
            make.height.equalTo(@20);
//            make.width.equalTo(@(Y_StockRightViewWidth));
        }];
    }
    return _maxValueLabel;
}

#pragma mark middlePriceLabel的get方法
-(UILabel *)middleValueLabel
{
    if (!_middleValueLabel) {
        _middleValueLabel = [self private_createLabel];
        [self addSubview:_middleValueLabel];
        [_middleValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
            make.height.width.equalTo(self.maxValueLabel);
//             make.width.equalTo(@(Y_StockRightViewWidth));
        }];
    }
    return _middleValueLabel;
}

#pragma mark minPriceLabel的get方法
-(UILabel *)minValueLabel
{
    if (!_minValueLabel) {
        _minValueLabel = [self private_createLabel];
        [self addSubview:_minValueLabel];
        [_minValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self);
            make.height.width.equalTo(self.maxValueLabel);
//             make.width.equalTo(@(Y_StockRightViewWidth));
        }];
    }
    return _minValueLabel;
}

#pragma mark - 私有方法
#pragma mark 创建Label
- (UILabel *)private_createLabel
{
    UILabel *label = [UILabel new];
//    CGFloat scale = [UIScreen mainScreen].bounds.size.width/375.0;
//    if (_isFull) {
//        scale = [UIScreen mainScreen].bounds.size.height/375.0;
//    }
//    label.font = [UIFont systemFontOfSize:9*scale];
    label.textColor = [UIColor assistTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:label];
    return label;
}
@end
