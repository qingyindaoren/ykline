//
//  Y_StockChartViewItemModel.m
//  ICO
//
//  Created by yunke on 2018/2/5.
//  Copyright © 2018年 yunke. All rights reserved.
//

#import "Y_StockChartViewItemModel.h"


@implementation Y_StockChartViewItemModel
+ (instancetype)itemModelWithTitle:(NSMutableArray *)titles type:(Y_StockChartSegViewType)type
{
    Y_StockChartViewItemModel *itemModel = [Y_StockChartViewItemModel new];
    itemModel.titles = titles;
    itemModel.segViewType = type;
    return itemModel;
}
@end
