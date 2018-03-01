//
//  Y_StockChartViewItemModel.h
//  ICO
//
//  Created by yunke on 2018/2/5.
//  Copyright © 2018年 yunke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Y_StockChartConstant.h"
@interface Y_StockChartViewItemModel : NSObject
@property (nonatomic, strong) NSMutableArray *titles;

@property (nonatomic, assign) Y_StockChartSegViewType segViewType;

+ (instancetype)itemModelWithTitle:(NSArray *)titles type:(Y_StockChartSegViewType)type;
@end
