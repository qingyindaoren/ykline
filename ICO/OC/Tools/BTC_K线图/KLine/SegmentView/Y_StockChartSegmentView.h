//
//  Y_StockChartSegmentView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/2.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Y_StockChartSegmentView;
@class  Y_StockChartViewItemModel;
@protocol Y_StockChartSegmentViewDelegate <NSObject>
-(void)addKlineSelectView:(Y_StockChartViewItemModel*)model;
-(void)showKlineView;

-(void)addMASelectView:(Y_StockChartViewItemModel*)model;
-(void)showMAView;

-(void)addKDJSelectView:(Y_StockChartViewItemModel*)model;
-(void)showKDJView;

-(void)addToneSelectView:(Y_StockChartViewItemModel*)model;
-(void)showToneView;



@end


@interface Y_StockChartSegmentView : UIView

- (instancetype)initWithItems:(NSArray *)items;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id <Y_StockChartSegmentViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSArray *itemModels;

@end
