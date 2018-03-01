//
//  Y_AccessoryMAView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/4.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_AccessoryMAView.h"
#import "Masonry.h"
#import "UIColor+Y_StockChart.h"
#import "Y_KLineModel.h"

@interface Y_AccessoryMAView()

@property (strong, nonatomic) UILabel *accessoryDescLabel;

@property (strong, nonatomic) UILabel *DIFLabel;

@property (strong, nonatomic) UILabel *DEALabel;



@end
@implementation Y_AccessoryMAView

- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}

+(instancetype)view
{
    Y_AccessoryMAView *MAView = [[Y_AccessoryMAView alloc]init];
    
    return MAView;
}
-(void)maProfileWithModel:(Y_KLineModel *)model
{
    if(self.targetLineStatus != Y_StockChartTargetLineStatusKDJ)
    {
        _accessoryDescLabel.text = @" MACD(12,26,9)";
        if (fabs(model.DIF.floatValue)<10) {
            _DIFLabel.text = [NSString stringWithFormat:@" DIF:%.6f",model.DIF.floatValue];
           
            
       
        }else{
            
           
            _DIFLabel.text = [NSString stringWithFormat:@" DIF:%.4f",model.DIF.floatValue];
        }
        if (fabs(model.DEA.floatValue)<10) {
             _DEALabel.text = [NSString stringWithFormat:@" DEA:%.6f",model.DEA.floatValue];
        }else{
           _DEALabel.text = [NSString stringWithFormat:@" DEA:%.4f",model.DEA.floatValue];
        }
        if (fabs(model.MACD.floatValue)<10) {
          _MACDLabel.text = [NSString stringWithFormat:@" MACD:%.6f",model.MACD.floatValue];
        }else{
             _MACDLabel.text = [NSString stringWithFormat:@" MACD:%.4f",model.MACD.floatValue];
        }
        if (_isFull) {
            _DIFLabel.text = [NSString stringWithFormat:@" DIF:%.8f",model.DIF.floatValue];
            _DEALabel.text = [NSString stringWithFormat:@" DEA:%.8f",model.DEA.floatValue];
            _MACDLabel.text = [NSString stringWithFormat:@" MACD:%.8f",model.MACD.floatValue];
        }
        
        
    } else {
        _accessoryDescLabel.text = @" KDJ(9,3,3)";
        
        _DIFLabel.text = [NSString stringWithFormat:@" K:%.8f",model.KDJ_K.floatValue];
        _DEALabel.text = [NSString stringWithFormat:@" D:%.8f",model.KDJ_D.floatValue];
        _MACDLabel.text = [NSString stringWithFormat:@" J:%.8f",model.KDJ_J.floatValue];
    }


}
-(void)setIsFull:(BOOL)isFull{
    _isFull = isFull;
    _DIFLabel = [self private_createLabel];
    _DEALabel = [self private_createLabel];
    _MACDLabel = [self private_createLabel];
    _accessoryDescLabel = [self private_createLabel];
    
    
    
    _DIFLabel.textColor = [UIColor ma7Color];
    _DEALabel.textColor = [UIColor ma30Color];
    _MACDLabel.textColor = [UIColor mainTextColor];
    
    
    [_accessoryDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    [_DIFLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_accessoryDescLabel.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    [_DEALabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_DIFLabel.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [_MACDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_DEALabel.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
- (UILabel *)private_createLabel
{
    UILabel *label = [UILabel new];
    CGFloat scale = [UIScreen mainScreen].bounds.size.width/375.0;
    if (_isFull) {
        scale = [UIScreen mainScreen].bounds.size.height/375.0;
    }
    label.font = [UIFont systemFontOfSize:10*scale];
    label.textColor = [UIColor assistTextColor];
    [self addSubview:label];
    return label;
}

@end
